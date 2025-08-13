#!/usr/bin/env bash
set -e

# Colors
green="\033[1;32m"
red="\033[1;31m"
blue="\033[1;34m"
reset="\033[0m"

# Check if inside a Git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${red}Error:${reset} Not inside a Git repository."
    exit 1
fi

# Prompt for inputs
read -rp "$(echo -e ${blue}Enter new branch name:${reset} )" branch
read -rp "$(echo -e ${blue}Enter commit message:${reset} )" commit_msg
read -rp "$(echo -e ${blue}Enter PR title:${reset} )" pr_title
read -rp "$(echo -e ${blue}Enter PR description:${reset} )" pr_desc

# Create new branch
git checkout -b "$branch"

# Add and commit changes
git add .
git commit -m "$commit_msg"

# Push branch
git push -u origin "$branch"

# Create PR with gh CLI
gh pr create --base development --head "$branch" --title "$pr_title" --body "$pr_desc"

echo -e "${green}✔ Done! PR created from branch '${branch}' to 'development'.${reset}"
