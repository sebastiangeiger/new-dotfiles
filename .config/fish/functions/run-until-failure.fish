function run-until-failure
  set -l file $argv[1]
  set -l contents (cat $file)
  set exit_status 0
  for command in $contents
    printf "\n\$> '%s'\n\n" $command
    eval $command
    if [ $status -ne 0 ]
      set_color $fish_color_error
      printf "%s failed!\n" $command
      set_color normal
      set exit_status 1
      break
    else
      pop $file
    end
  end
  return $exit_status
end

