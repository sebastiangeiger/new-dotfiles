function fish_prompt
  set -l last_status $status
  set -l path_component (prompt_pwd)
  set_color $fish_color_cwd
  set -l path_component_length (echo $path_component | awk '{print length($0)}')
  echo -n $path_component
  set_color 424242
  echo -n " on "
  __git_branch
  set_color 424242
  echo -n " at "
  set_color a98758
  date "+%H:%M"
  if not test $last_status -eq 0
    set_color $fish_color_error
  else
    set_color green
  end
  printf '$ '
  set_color normal
end

function fish_right_prompt
  __git_status
end


function __git_branch
  set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree --short HEAD ^/dev/null)
  test -n "$repo_info"; or return

  set -l git_dir         $repo_info[1]
  set -l inside_gitdir   $repo_info[2]
  set -l bare_repo       $repo_info[3]
  set -l inside_worktree $repo_info[4]
  set -l short_sha
  if test (count $repo_info) = 5
    set short_sha $repo_info[5]
  end

  set branch (command git symbolic-ref -q --short HEAD ^/dev/null)
  set branch (echo $branch | awk '{printf substr($0,0,40)}')
  set_color green
  printf '%s' $branch
  set_color normal
end

function __git_status
  set -l dirty
  command git diff --no-ext-diff --quiet --exit-code
  set -l os $status
  if test $os -ne 0
    set dirty '*'
  end
  set -l untracked (command git ls-files --others --exclude-standard | wc -l)
  if test $untracked -ne 0
    set untracked '*'
  else
    set untracked
  end

  set_color yellow
  printf '%s' $untracked
  set_color red
  printf '%s' $dirty
  set_color normal
end
