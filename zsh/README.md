# dotfiles/zsh

Zsh configuration managed and symlinked via `install.sh`.

## What goes here

| File | Symlink target | Purpose |
|---|---|---|
| `.zshrc` | `~/.zshrc` | Main zsh config: plugins, PATH, options |
| `.zshenv` | `~/.zshenv` | Environment variables loaded for all shells |
| `.zsh_aliases` | sourced from `.zshrc` | All aliases in one place |
| `.zsh_functions` | sourced from `.zshrc` | Shell functions (e.g. `note`, `mkproject`) |
| `.zprofile` | `~/.zprofile` | Login shell config (conda init goes here) |

## Setup

```bash
ln -sf ~/Development/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Development/dotfiles/zsh/.zshenv ~/.zshenv
```

## Useful aliases to add

```zsh
# Daily notes
alias note='f() { vim ~/Development/notes/daily/$(date +%Y-%m-%d).md }; f'

# Conda envs
alias de='conda activate data'
alias ml='conda activate ml'

# Navigation
alias dev='cd ~/Development'
alias proj='cd ~/Development/projects'
```
