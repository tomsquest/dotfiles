# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors;
colors;

# Create a separation bar after the path
# see: http://aperiodic.net/phil/prompt/
function compute-separation-bar {
  # Compute the lengths of the strings
  local exitcodesize=${#${(%):-%(?..%? )}}
  local promptsize=${#${(%):-hh-mm-ss-}}
  local pwdsize=${#${(%):-$PWD}}
  local termwidth=$(($COLUMNS - 1))

  # The horizontal bar
  barsize=""
  # The path, truncated if too long
  pathsize=""

  # Compute the path length and the horizontal bar
  if [[ "$promptsize + $pwdsize + $exitcodesize" -gt $termwidth ]]; then
    ((pathsize=$termwidth - $promptsize - $exitcodesize))
  else
    barsize="\${(l.(($termwidth - $promptsize - $pwdsize - $exitcodesize))..—.)}"
  fi
}
add-zsh-hook precmd compute-separation-bar

# Finally, set the prompt
local the_date="%{$fg_bold[green]%}%D{%H:%M:%S}%{$reset_color%}"
local last_command_status="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
local start_of_input="%{$fg_bold[white]%}$%{$reset_color%}"
PROMPT='$the_date %{$fg_bold[blue]%}%$pathsize<...<$PWD%<<%{$reset_color%} $last_command_status%{$fg_bold[white]%}${(e)barsize}%{$reset_color%}
$start_of_input '

# Git prompt, displayed at right (RPROMPT)
# See: https://github.com/olivierverdier/zsh-git-prompt
RPROMPT='$(git_super_status)'
