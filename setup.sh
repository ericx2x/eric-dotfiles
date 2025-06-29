#!/bin/bash

# Function to install Oh My Zsh
install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Function to install Powerlevel9k
install_powerlevel9k() {
    git clone https://github.com/Powerlevel9k/powerlevel9k.git $HOME/.powerlevel9k
}

# Function to install zsh-autosuggestions
install_zsh_autosuggestions() {
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

# Function to install fzf
install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

# Function to install The Silver Searcher
install_silver_searcher() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -x "$(command -v apt)" ]; then
            sudo apt install -y silversearcher-ag
        elif [ -x "$(command -v dnf)" ]; then
            sudo dnf install -y the_silver_searcher
        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S the_silver_searcher
        else
            echo "Unsupported Linux distribution. Please install The Silver Searcher manually."
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install the_silver_searcher
    else
        echo "Unsupported OS. Please install The Silver Searcher manually."
    fi
}

# Function to set up Zsh as the default shell
set_default_shell() {
    chsh -s $(which zsh)
}

# Function to install Neovim
install_neovim() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -x "$(command -v apt)" ]; then
            sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt update && sudo apt install -y neovim
        elif [ -x "$(command -v dnf)" ]; then
            sudo dnf install -y neovim
        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S neovim
        else
            echo "Unsupported Linux distribution. Please install Neovim manually."
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install neovim
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        echo "Please install Neovim manually on Windows."
    else
        echo "Unsupported OS. Please install the required software manually."
    fi
}

# Install Oh My Zsh
install_oh_my_zsh

# Install Powerlevel9k
install_powerlevel9k

# Install zsh-autosuggestions
install_zsh_autosuggestions

# Install fzf
install_fzf

# Install The Silver Searcher
install_silver_searcher

# Sy
