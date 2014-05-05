# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git ruby brew osx rvm ruby git-flow mvn)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/check_if_files_were_modified.sh
source $HOME/.pushover.conf

# Alias ==================
alias ssh-tunnel="ssh -ND 8080"
alias gti="git"
if [[ -f /usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim ]];then
  alias vim="/usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim"
  export EDITOR="/usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim -f"
else
  export EDITOR="vim -f"
fi
alias m="vim"
alias n="notify"
alias v="vagrant"
alias r="rails"
if [[ -f /usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs ]];then
  alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
fi
alias bx="nocorrect bundle exec"
alias bundle="nocorrect bundle"
alias gs="git st"
alias ga="git add"
alias gap="git ap"
alias gl="git l"
alias gh="git h"
alias gd="git diff"
alias gfa="git fetch --all"
alias gf="nocorrect git flow"
alias feature="gf feature"

alias t="nocorrect todo.sh"
alias te="vim ~/Dropbox/todo/todo.txt"
alias diff="colordiff -u"
alias git-email-personal='git config user.email "sebastian.geiger@gmail.com"'
alias git-email-mo='git config user.email "sebastian.geiger@mo-stud.io"'

alias wifi-on="networksetup -setairportpower en0 on"
alias wifi-off="networksetup -setairportpower en0 off"
# /Alias =================

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:/usr/local/sbin # for some brews
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin

# Needed for tmux utf8 ==============
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# /Needed for tmux utf8 =============

# The notify command is a function
. $HOME/.bin/notify

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export ECLIPSE_HOME="/Developer/Eclipse/indigo-3.7.1"
export PATH="/usr/local/bin":$PATH:$ECLIPSE_HOME:"$HOME/.cabal/bin":"$HOME/.bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
