# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=`whoami`

# Enable plugins
plugins=(git zsh-autosuggestions)

# Start Tmux automatically if not already inside a Tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

#use nvim over vim
alias vi='nvim'

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
