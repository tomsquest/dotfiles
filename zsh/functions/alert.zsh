function alert() {
  cmd=$@

  # Hide 'printAndRun' from being shown in notification
  if [[ $1 == "printAndRun" ]]; then
    cmd_as_array=("${(s/ /)cmd}")
    # Remove first argument
    cmd=$cmd_as_array[2,-1]
  fi

  # Execution
  eval "$@"
  exitstatus="$?"

  # Notification
  if [[ $exitstatus = "0" ]]; then
    notify_success $cmd $exitstatus
  else
    notify_failure $cmd $exitstatus
  fi
  return $exitstatus
}

function notify_success() {
  if [ -f /usr/bin/notify-send ]; then
    /usr/bin/notify-send -i "terminal" "Success" "$1"
  fi
  if [ -f /usr/bin/beep ]; then
    /usr/bin/beep -l 100 -f 500 -n -l 50 -f 1000
  fi
}

function notify_failure() {
  if [ -f /usr/bin/notify-send ]; then
    /usr/bin/notify-send -i "error" "Error: $2" "$1"
  fi
  if [ -f /usr/bin/beep ]; then
    /usr/bin/beep -l 100 -f 100 -r 2
  fi
}
