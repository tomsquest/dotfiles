# Original idea: http://aperiodic.net/phil/prompt/

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors
colors

function build_prompt {
    # Exit code needs to be computed first
    local -r exit_code="${(%):-%(?..%? )}"
    local -r time="$(date +"%T")"

    # Build separator bar
    local -r separator="―"
    local -r assembled_prompt="$time $PWD $exit_code"
    local -r assembled_prompt_length=${#assembled_prompt}
    local -r bar_length=$((COLUMNS - ($assembled_prompt_length % COLUMNS)))
    local -r bar="\${(l.(($bar_length))..$separator.)}"

    # Build prompt
    local -r colored_exit="%{$fg_bold[red]%}$exit_code%{$reset_color%}"
    local -r colored_time="%{$fg_bold[green]%}$time%{$reset_color%}"
    local -r colored_path="%{$fg_bold[blue]%}$PWD%{$reset_color%}"
    local -r colored_bar="%{$fg_bold[white]%}$bar%{$reset_color%}"
    local -r start_of_input="%{$fg_bold[white]%}$%{$reset_color%}"
    PROMPT="$colored_time $colored_path $colored_exit$colored_bar
$start_of_input "
}

add-zsh-hook precmd build_prompt

# Git prompt
# See: https://github.com/olivierverdier/zsh-git-prompt
RPROMPT='$(git_super_status)'
