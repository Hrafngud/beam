# 🛸 beam

**beam** is a simple, interactive shell script for quickly creating Git branches, committing changes, and opening pull requests via the GitHub CLI — all in one smooth command.

## ✨ Features

- Checks if you are inside a Git repository before running.
- Interactive prompts for:
  - Branch name
  - Commit message
  - PR title
  - PR description
- Creates a new branch and commits changes.
- Pushes the branch to `origin`.
- Opens a pull request targeting the `development` branch via [`gh`](https://cli.github.com/).

## 📦 Installation

1. Clone or copy the `beam.sh` script to `~/scripts`:
    ```bash
    mkdir -p ~/scripts
    nano ~/scripts/beam.sh
    # Paste the script content here, save and exit (CTRL+O, CTRL+X)
    chmod +x ~/scripts/beam.sh
    ```

2. Add an alias to your `zsh` configuration:
    ```bash
    echo 'alias beam="~/scripts/beam.sh"' >> ~/.zshrc
    source ~/.zshrc
    ```

3. Ensure the GitHub CLI is installed and authenticated:
    ```bash
    gh auth login
    ```

## 🚀 Usage

From any Git repository, run:
```bash
beam
