# Original idea: http://aperiodic.net/phil/prompt/

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors
colors

# Configure ZSH vcs module
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%b %u%c"
zstyle ':vcs_info:*' actionformats "%b %u%c %a"
zstyle ':vcs_info:*' check-for-changes true

function build_prompt {
    # Exit code of last command
    # - Needs to be computed first
    # - if not zero, add a space after it
    local -r exit_code="${(%):-%(?..%? )}"

    # Prompt elements
    vcs_info
    local -r gitinfo="${vcs_info_msg_0_%% }" # Trim possible trailing space
    local -r time="$(date +"%T")"
    local -r assembled_prompt="$time $PWD $exit_code $gitinfo"
    local -r assembled_prompt_length=${#assembled_prompt}

    # Separator bar
    local -r separator="―"
    local -r bar_length=$((COLUMNS - assembled_prompt_length % COLUMNS))
    local -r bar="\${(l.(($bar_length))..$separator.)}"

    # Build prompt
    local -r colored_exit="%B%F{red}$exit_code%f%b"
    local -r colored_time="%B%F{green}$time%f%b"
    local -r colored_path="%B%F{blue}$PWD%f%b"
    local -r colored_bar="%B%F{white}$bar%f%b"
    # Color GIT info depending of status: unstaged/staged
    if [[ $gitinfo = *[\ ]* ]]; then
      local -r colored_gitinfo="%B%F{yellow}$gitinfo%f%b"
    else
      local -r colored_gitinfo="%B%F{green}$gitinfo%f%b"
    fi

    local -r start_of_input="%B%F{white}$%f%b"
    PROMPT="$colored_time $colored_path $colored_gitinfo $colored_exit$colored_bar
$start_of_input "
}

add-zsh-hook precmd build_prompt
