# Ubuntu: don't run compinit in /etc/zsh/zshrc, it is done (with a cache) at the end of ~/.zshrc
skip_global_compinit=1

# Remove duplicates in PATH and FPATH (they accumulate in nested shells, which inherit the parent PATH)
# Only effective on array assignments (`path=(...)`), not on `PATH="..."`
typeset -U path fpath

# set PATH so it includes user's private bin directories
path=("$HOME/bin" "$HOME/.local/bin" $path)

# LinuxBrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Asdf
path=("$HOME/.asdf/shims" $path)
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# Flatpak
flatpak_xdg_path="/var/lib/flatpak/exports/share"
if [ -n "${XDG_DATA_DIRS##*${flatpak_xdg_path}}" ] && [ -n "${XDG_DATA_DIRS##*${flatpak_xdg_path}:*}" ]; then
    export XDG_DATA_DIRS="${XDG_DATA_DIRS}:${flatpak_xdg_path}"
fi
