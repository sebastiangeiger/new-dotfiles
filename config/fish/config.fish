set -x DOTFILES $HOME/dotfiles
set -x EDITOR "nvim -u ~/.nvimrc"
set -x GIT_EDITOR "nvim -u ~/.nvimrc"
set -x PATH /usr/local/bin $HOME/.bin /usr/local/share/npm/bin $PATH
set -x RBENV_ROOT /usr/local/var/rbenv
set -x PATH $RBENV_ROOT/bin $RBENV_ROOT/shims $PATH
set -x PATH /anaconda/bin $PATH
set -x PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH
set -x MPD_HOST "192.168.1.22"
set -x LESS "-RM~gIsw"


if test status --is-interactive
  check_if_files_were_modified
end

# Alias ==================
alias ssh-tunnel="ssh -ND 8080"
abbr -a gti="git"
abbr -a g="git"
abbr -a n="notify"
abbr -a v="vagrant"
abbr -a r="rails"
abbr -a bx="bundle exec"
abbr -a gp="git push"
abbr -a gc="git ci"
abbr -a ga="git add"
abbr -a gap="git ap"
abbr -a gl="git l"
abbr -a gh="git show HEAD --stat"
abbr -a gd="git diff"
abbr -a rebi="git rebase -i origin/develop"
abbr -a reb="git rebase origin/develop"
abbr -a cont="git rebase --continue"
alias vim="nvim -u ~/.nvimrc"
alias gro="git reset --hard origin/(git rev-parse --abbrev-ref HEAD)"

alias diff="colordiff -u"
abbr -a ff="bundle exec rspec --fail-fast"
alias git-email-personal='git config user.email "sebastian.geiger@gmail.com"'
alias git-email-big-nerd-ranch='git config user.email "sebastian@bignerdranch.com"'
alias git-email-bnr=git-email-big-nerd-ranch
alias git-delete-merged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias wifi-on="networksetup -setairportpower en0 on"
alias wifi-off="networksetup -setairportpower en0 off"
alias wifi-restart="wifi-off; sleep 2; wifi-on"

alias date-only="date \"+%Y-%m-%d\""

alias ts="travis status --skip-version-check"
alias th="travis history --skip-version-check"

set -g fish_greeting ""

source ~/.config/fish/functions/secrets.fish
source ~/.config/fish/functions/colors.fish
