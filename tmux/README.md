# dotfiles/tmux

tmux configuration managed and symlinked via `install.sh`.

## What goes here

| File | Symlink target | Purpose |
|---|---|---|
| `.tmux.conf` | `~/.tmux.conf` | Main tmux config: prefix key, keybindings, status bar |
| `.tmux.conf.local` | `~/.tmux.conf.local` | Local overrides (not synced, optional) |

## Setup

```bash
ln -sf ~/Development/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

Reload without restarting:
```bash
tmux source-file ~/.tmux.conf
```

## Recommended baseline settings

- Prefix: `Ctrl+a` (ergonomic over default `Ctrl+b`)
- Mouse mode on
- Vi keys in copy mode
- Window and pane indexing from 1
- 256 color support: `set -g default-terminal "screen-256color"`
