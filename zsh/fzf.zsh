export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='rg --files --hidden 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --files --hidden --null "$1" 2>/dev/null | xargs -0 dirname | sort -u"

# Disable preview, useless for History completion
export FZF_CTRL_R_OPTS="--no-preview"
export FZF_ALT_C_OPTS="--no-preview"

source $HOME/.local/fzf/completion.zsh
source $HOME/.local/fzf/key-bindings.zsh

#
# Overrides completion, eg. `cd **`, `vim **`
#
_fzf_compgen_path() {
  rg --files --hidden "$1" 2>/dev/null
}

_fzf_compgen_dir() {
  rg --files --hidden --null "$1" 2>/dev/null | xargs -0 dirname | sort -u
}

# Open the selected file with keybindings
# Usage:   o [FUZZY PATTERN]
# Example: o SomeFile.py
#    then press ctrl-o to open, ctrl-e to edit in vim, enter to open in Idea)
o() {
  if [ -d "$1" ]; then
    xdg-open "$1"
  elif [ -f "$1" ]; then
    idea "$1"
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
        idea "$file"
        ;;
      esac
    fi
  fi
}
