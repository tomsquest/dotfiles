export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--exit-0 --select-1 --expect=ctrl-o,ctrl-e"
export FZF_ALT_C_COMMAND="rg --files --hidden --null "$1" | xargs -0 dirname | sort -u"

source $HOME/.local/fzf/completion.zsh
source $HOME/.local/fzf/key-bindings.zsh

#
# Overrides completion, eg. `cd **`, `vim **`
#
_fzf_compgen_path() {
  rg --files --hidden "$1"
}

_fzf_compgen_dir() {
  rg --files --hidden --null "$1" | xargs -0 dirname | sort -u
}


# Open the selected file with keybindings
# Usage:   o [FUZZY PATTERN]
# Example: o SomeFile.py
#    then press ctrl-o to open, ctrl-e to edit in vim, enter to open in Idea)
fzf-open() {
  #zle accept-line
  local out file key
  IFS=$'\n' out=($(fzf --query="$1" --exit-0 --select-1 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    case "$key" in
      "ctrl-o")
        xdg-open "$file"
        ;;
      "ctrl-e")
        ${EDITOR:-vim} "$file"
        ;;
      *)
        idea "$file"
        ;;
    esac
  fi
  #zle redisplay
}


fzf-open-file() {
  #IFS=$'\n' out="$(__fsel)"
  out="$(__fsel)"
  local ret=$?
  echo "Out: $out."
  echo "Ret: $ret."

  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  echo "Key: $key."
  echo "Fil: $file."

  return $ret
}

zle     -N   fzf-open-file
bindkey '^O' fzf-open-file


