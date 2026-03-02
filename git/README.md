# dotfiles/git

Git configuration files managed and symlinked via `install.sh`.

## What goes here

| File | Symlink target | Purpose |
|---|---|---|
| `.gitconfig` | `~/.gitconfig` | Global git identity, aliases, defaults |
| `.gitignore_global` | `~/.gitignore_global` | Global gitignore applied to every repo |
| `.gitmessage` | `~/.gitmessage` | Commit message template |

## Setup

After adding files here, register symlinks in `../install.sh`:
```bash
ln -sf ~/Development/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/Development/dotfiles/git/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global commit.template ~/.gitmessage
```

## Recommended `.gitignore_global` entries
```
.DS_Store
.env
*.pyc
__pycache__/
.idea/
.vscode/
*.swp
*.swo
```
