function fish_prompt
  set -l last_status $status
  _check_for_git
  _first_line $last_status
  echo ""
  _second_line $last_status
end

function _check_for_git
  git status 1>/dev/null 2>/dev/null
  if test $status -eq 0
    set -g inside_git_repository 1
  else
    set -g inside_git_repository 0
  end
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
  if test $inside_git_repository -eq 1
    echo -n " on "
    __git_branch $path_component_length 16
  end
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
  set -l path_component_length $argv[1]
  set -l used_up_by_text       $argv[2]

  test $inside_git_repository -eq 1; or return

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

  set -l branch (command git symbolic-ref -q --short HEAD ^/dev/null)
  set -l max_branch_name_length (echo $COLUMNS' - '$path_component_length' - '$used_up_by_text' - 1' | bc)
  set -l branch_name_length (echo $branch | awk '{print length($0)}')
  if test $branch_name_length -gt $max_branch_name_length
    set -l length (echo $max_branch_name_length' - 1' | bc)
    set -l shorten_command '{printf substr($0,0,'$length')}'
    set branch (echo $branch | awk $shorten_command)'…'
  end
  set_color $fish_color_prompt_git_branch
  printf '%s' $branch
  set_color normal
end

function __git_status
  test $inside_git_repository -eq 1; or return
  set -l dirty
  command git diff --no-ext-diff --quiet --exit-code
  set -l os $status
  if test $os -ne 0
    set modified_color yellow
  else
    set modified_color black
  end
  set -l untracked (command git ls-files --others --exclude-standard | wc -l)
  if test $untracked -ne 0
    set untracked_color red
  else
    set untracked_color black
  end
  set -l staged (command git diff --cached --numstat | wc -l)
  if test $staged -ne 0
    set staged_color green
  else
    set staged_color black
  end

  set_color $untracked_color
  printf '█ '
  set_color $modified_color
  printf '█ '
  set_color $staged_color
  printf '█ '
  set_color normal
end
