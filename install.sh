#!/bin/bash
DOTFILES="$HOME/Development/dotfiles"
echo 'Linking dotfiles...'
ln -sf $DOTFILES/zsh/.zshrc ~/.zshrc
ln -sf $DOTFILES/zsh/.p10k.zsh ~/.p10k.zsh
mkdir -p ~/.config && ln -sf $DOTFILES/nvim ~/.config/nvim
ln -sf $DOTFILES/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/git/.gitignore_global ~/.gitignore_global
ln -sf $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
echo 'All dotfiles linked successfully.'
