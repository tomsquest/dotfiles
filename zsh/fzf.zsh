export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $HOME/.local/fzf/completion.zsh

#
# Overrides completion, eg. `cd **`, `vim **`
#
_fzf_compgen_path() {
  rg --files --hidden --follow -g "!{.git,node_modules}/*" "$1"
}

_fzf_compgen_dir() {
  rg --files --hidden --null -g "!{.git,node_modules}/*" "$1" | xargs -0 dirname | sort -u
}