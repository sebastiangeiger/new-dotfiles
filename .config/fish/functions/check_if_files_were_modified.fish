function check_if_files_were_modified
  set -l pwd (pwd)
  set -l the_status ( cd $DOTFILES; git status --porcelain | wc -l )
  set -l the_remote_status ( cd $DOTFILES; git status | grep "Your branch is" | wc -l)
  if test $the_status -ne 0; or $the_remote_status -ne 0
    set_color red
    echo "╭                                               ╮"
    echo "  The dotfiles have been changed,"
    echo "    please consider pushing them back to github"
    echo "╰                                               ╯"
    set_color normal
  end
  cd $pwd
end
