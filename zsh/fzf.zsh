export FZF_DEFAULT_OPTS='--height=50% --layout=reverse --info=inline --multi --preview=" --style=numbers --color=always --line-range :500 {}"'

export FZF_DEFAULT_COMMAND='rg --files --hidden 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --files --hidden --null . 2>/dev/null | xargs -0 dirname | sort -u"

# Disable preview, useless for History completion
export FZF_CTRL_R_OPTS="--no-preview"
export FZF_ALT_C_OPTS="--no-preview"

source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh"
source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh"