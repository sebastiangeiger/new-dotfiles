set -x DOTFILES $HOME/dotfiles
set -x EDITOR "vim"
set -x PATH /usr/local/bin $HOME/.bin $PATH

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
