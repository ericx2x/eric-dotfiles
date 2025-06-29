#!/bin/bash

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel9k
git clone https://github.com/Powerlevel9k/powerlevel9k.git $HOME/.powerlevel9k

# Symlink .zshrc
ln -sf $(pwd)/.zshrc $HOME/.zshrc

# Create Neovim config directory if it doesn't exist
mkdir -p $HOME/.config/nvim

# Symlink Neovim config
ln -sf $(pwd)/nvim/init.vim $HOME/.config/nvim/init.vim

echo "Setup complete! Please restart your terminal."
