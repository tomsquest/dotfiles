# Create directory and move into it
mcd() {
    [ -n "$1" ] && mkdir -p "$1" && cd "$1" || exit
}

# Delete old docker stuff
docker-clean() {
  local MAX_AGE="90d"
  echo "Deleting containers, images and volumes older than $MAX_AGE"
  docker run -ti \
    -v /var/run/docker.sock:/var/run/docker.sock \
    yelp/docker-custodian \
      --max-image-age "$MAX_AGE" \
      --max-container-age "$MAX_AGE" \
      --dangling-volumes
}

# Open the selected file with keybindings
# Usage:   o [FUZZY PATTERN]
# Example: o file.py
#    - press ctrl-o to open
#    - press ctrl-e to edit in vim
#    - press enter to open in Jetbrains IntelliJ IDEA
o() {
  if [ -d "$1" ]; then
    xdg-open "$1"
  elif [ -f "$1" ]; then
    idea.sh "$1"
  elif ! [ -z "$1" ] && ! [ -f "$1" ]; then
    echo "File $1 does not exist. Create it? (y/n)"
    read -k 1 answer
    if [ -z "$answer" ] || [ "$answer" = "y" ]; then
      touch "$1"
      idea.sh "$1"
    fi
    echo
  else
    local out file key
    IFS=$'\n' out=($(fzf --query="$1" --exit-0 --select-1 --expect=ctrl-o,ctrl-e))
    key=$(head -1 <<<"$out")
    file=$(head -2 <<<"$out" | tail -1)
    if [ -n "$file" ]; then
      case "$key" in
      "ctrl-o")
        xdg-open "$file"
        ;;
      "ctrl-e")
        ${EDITOR:-vim} "$file"
        ;;
      *)
        idea.sh "$file"
        ;;
      esac
    fi
  fi
}
