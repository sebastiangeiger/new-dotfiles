function notify
  set -l last_status $status
  set -l title "Terminal"
  set -l pwd (pwd)
  if test $last_status -eq 0
    set message "... is done in $pwd."
  else
    set message "... failed in $pwd."
  end
  set -l idle_time (idle_time)
  if test (echo "$idle_time > 45" | bc) -eq 1
    set message $message "(Idle for "{$idle_time}s")"
    curl https://api.pushover.net/1/messages.json -F token=$PUSHOVER_TOKEN \
      -F user=$PUSHOVER_USER -F message="$message" -F title=$title --silent \
      > /dev/null
  end
  terminal-notifier -message "$message" > /dev/null
  #This passes the exitcode through to the shell
  return $last_status
end
