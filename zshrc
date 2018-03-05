# ZSH-specific
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Environment variables
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PATH="/home/xy24/bin:/home/xy24/mongo-bin/link:${PATH}"
export CSCOPE_EDITOR=vim
export DOTFILES=$HOME/projects/dotfiles
export WORKSPACE=$HOME/projects

# Other configurations
# 10ms for key sequences
KEYTIMEOUT=1

# Load all files in ~/.zsh
for fn in ~/.zsh/*; do
  source $fn
done
