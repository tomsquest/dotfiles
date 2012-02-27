# open the file or ask to open it with sudo if write-protected
function o() {
  local opener=xdg-open

  if [[ -z "$1" ]]; then
    echo "$opener expects one argument"
    return 1
  fi

  if [[ -a "$1" ]]; then
    if [[ -w "$1" ]]; then
      $opener $1
    else
      echo -n "You don't have write permission for $1, use sudo instead (y/n) ? "
      read reply

      if [[ $reply == "y" ]]; then
        sudo $opener $1
      else
        $opener $1
      fi
    fi
  else
    echo -n "File or directory does not exist. Do you want to create it as a file (y/n) ? "
    read reply

    if [[ $reply == "y" ]]; then
      touch $1
      $opener $1
    else
      return 1
    fi
  fi
}
