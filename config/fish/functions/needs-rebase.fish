function needs-rebase
  set -l current_branch (git rev-parse --abbrev-ref HEAD)
  git fetch
  set -l up_to_date_branches (git branch --contains origin/develop)
  set needs_rebase true
  for up_to_date_branch in $up_to_date_branches
    set -l up_to_date_branch (echo $up_to_date_branch | sed 's/^\* //' | sed 's/^  //')
    if [ $up_to_date_branch = $current_branch ]
      set needs_rebase false
      break
    end
  end
  if [ $needs_rebase = true ]
    set_color $fish_color_error
    printf "'%s' needs to be rebased!\n" $current_branch
    set_color normal
    return 13
  else
    printf "'%s' is up to date\n" $current_branch
    return 0
  end
end
