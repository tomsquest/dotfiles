export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always --style=numbers --line-range=:500 {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='rg --files --hidden 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --files --hidden --null \"$1\" 2>/dev/null | xargs -0 dirname | sort -u"

# Disable preview, useless for History completion
export FZF_CTRL_R_OPTS="--no-preview"
export FZF_ALT_C_OPTS="--no-preview"

source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh"
source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh"

#
# Overrides completion, eg. `cd **`, `vim **`
#
_fzf_compgen_path() {
  rg --files --hidden "$1" 2>/dev/null
}

_fzf_compgen_dir() {
  rg --files --hidden --null "$1" 2>/dev/null | xargs -0 dirname | sort -u
}