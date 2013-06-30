# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

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
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git ruby brew osx rvm ruby git-flow mvn)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/check_if_files_were_modified.sh

# Alias ==================
alias ssh-tunnel="ssh -ND 8080"
alias gti="git"
alias kerberos-screen="krenew -biL -- screen -Dm; screen"
if [[ -f /usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim ]];then
  alias vim="/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim"
  export EDITOR="/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim -f"
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
if [[ -f /Applications/GitX.app/Contents/MacOS/GitX ]];then
  alias gitx="/Applications/GitX.app/Contents/MacOS/GitX"
fi
alias bx="bundle exec"
alias gs="git st"
alias ga="git add"
alias gap="git ap"
alias gl="git l"
alias gh="git h"
alias gd="git diff"
alias gf="nocorrect git flow"

alias t="todo.sh"
alias diff="colordiff -u"
alias git-email-personal='git config user.email "sebastian.geiger@gmail.com"'
alias git-email-mo='git config user.email "sebastian.geiger@mo-stud.io"'
# /Alias =================

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin

# Z - Jump Around! =======
#. /usr/local/Cellar/z/1.1/etc/profile.d/z.sh
# /Z - Jump Around! =====

# The notify command is a function
. $HOME/.bin/notify

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export ECLIPSE_HOME="/Developer/Eclipse/indigo-3.7.1"
export PATH="/usr/local/bin":$PATH:$ECLIPSE_HOME:"$HOME/.cabal/bin":"$HOME/.bin"
export CLOJURE="/usr/local/Cellar/clojure/1.4.0/clojure-1.4.0.jar"
export CLASSPATH=$CLASSPATH:$CLOJURE:"$HOME/.bin/server-2.3.4.jar"
