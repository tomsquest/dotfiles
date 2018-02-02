export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="cd ~/; rg --files --hidden --null "$1" 2> /dev/null | xargs -0 dirname | sort -u"

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