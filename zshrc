# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/new-dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud2.0"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git ruby brew osx rvm ruby git-flow mvn)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/check_if_files_were_modified.sh
# Vi Mode =================
bindkey -v 
bindkey '^R' history-incremental-search-backward
# /Vi Mode ================

# Alias ==================
alias ssh-tunnel="ssh -ND 8080"
# /Alias =================

# Coloring stderr =======
exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )
# /Coloring stderr ======

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export ECLIPSE_HOME="/Developer/Eclipse/indigo-3.7.1"
export EDITOR="vim -f"
export PATH="/usr/local/bin":$PATH:$ECLIPSE_HOME:"$HOME/.cabal/bin":"$HOME/.local/bin"
