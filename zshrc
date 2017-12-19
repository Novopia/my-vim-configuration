#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
#
# JAVA configuration
export  JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
# ANT configuration
export ANT_HOME="/usr/local/Cellar/ant/1.10.1/libexec"
export ANT_OPTS="-Xms64m -Xmx1500m"
# GO configuration
export GOROOT="/usr/local/go"

# PATH variable
export PATH="${PATH}:${JAVA_HOME}/bin:${ANT_HOME}/bin"

export CSCOPE_EDITOR=vim
# export TERM=xterm-256color
export WORKSPACE="/Users/xy24/projects"
export DOTFILES="/Users/xy24/projects/dotfiles"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="/usr/local/bin/vim"

# 10ms for key sequences
KEYTIMEOUT=1

