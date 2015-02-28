function fish_prompt
  set -l last_status $status
  _first_line $last_status
  echo ""
  _second_line $last_status
end

function _first_line
  set -l last_status $argv[1]
  set -l path_component (prompt_pwd)
  if not test $last_status -eq 0
    set prompt_background $fish_color_prompt_error_background
  else
    set prompt_background $fish_color_prompt_success_background
  end
  set_color $fish_color_prompt_path -b $prompt_background
  set -l path_component_length (echo $path_component | awk '{print length($0)}')
  echo -n $path_component
  set_color $fish_color_prompt_neutral -b $prompt_background
  echo -n " on "
  __git_branch
  set_color $fish_color_prompt_neutral -b $prompt_background
  echo -n " at "
  set_color $fish_color_prompt_time -b $prompt_background
  echo -n (date "+%H:%M")
  echo -n " "
  set_color $prompt_background -b black
  echo -n "▶"
  set_color black
  echo -n " "
end

function _second_line
  set -l last_status $argv[1]
  if not test $last_status -eq 0
    set_color $fish_color_prompt_error -b black
  else
    set_color $fish_color_prompt_success -b black
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
  set_color $fish_color_prompt_git_branch
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
