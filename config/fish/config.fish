set -x DOTFILES $HOME/dotfiles
set -x EDITOR "vim"
set -l tmux_length (echo $TMUX | wc -m)
if test $tmux_length -le 1
  #Sourcing outside of a TMUX session
  #For whatever reason manipulating the path inside a tmux session is causing
  #problems with rvm
  set -x PATH /usr/local/bin $HOME/.bin /usr/local/share/npm/bin $PATH
end
set -x PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH
set -x MPD_HOST "192.168.1.22"

#Need to invoke rvm once to initialize it
rvm > /dev/null

if test status --is-interactive
  check_if_files_were_modified
end

# Alias ==================
alias ssh-tunnel="ssh -ND 8080"
alias gti="git"
alias m="vim"
alias n="notify"
alias v="vagrant"
alias r="rails"
alias bx="bundle exec"
alias gp="git push"
alias gc="git ci"
alias gs="git st"
alias ga="git add"
alias gap="git ap"
alias gl="git l"
alias gh="git h"
alias gd="git diff"
alias gfa="git fetch --all"
alias gf="git flow"
alias feature="gf feature"

alias t="todo.sh"
alias te="vim ~/Dropbox/todo/todo.txt"
alias diff="colordiff -u"
alias git-email-personal='git config user.email "sebastian.geiger@gmail.com"'
alias git-email-mo='git config user.email "sebastian.geiger@mo-stud.io"'

alias wifi-on="networksetup -setairportpower en0 on"
alias wifi-off="networksetup -setairportpower en0 off"
