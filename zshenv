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

# Direnv
eval "$(direnv hook zsh)"

# Flatpak
flatpak_xdg_path="/var/lib/flatpak/exports/share"
if [ -n "${XDG_DATA_DIRS##*${flatpak_xdg_path}}" ] && [ -n "${XDG_DATA_DIRS##*${flatpak_xdg_path}:*}" ]; then
    export XDG_DATA_DIRS="${XDG_DATA_DIRS}:${flatpak_xdg_path}"
fi

# ###### START /etc/profile.d/apps-bin-path.sh
# Expand $PATH to include the directory where snappy applications go.
snap_bin_path="/snap/bin"
if [ -n "${PATH##*${snap_bin_path}}" ] && [ -n "${PATH##*${snap_bin_path}:*}" ]; then
    export PATH="$PATH:${snap_bin_path}"
fi

# Ensure base distro defaults xdg path are set if nothing filed up some
# defaults yet.
if [ -z "$XDG_DATA_DIRS" ]; then
    export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

# Desktop files (used by desktop environments within both X11 and Wayland) are
# looked for in XDG_DATA_DIRS; make sure it includes the relevant directory for
# snappy applications' desktop files.
snap_xdg_path="/var/lib/snapd/desktop"
if [ -n "${XDG_DATA_DIRS##*${snap_xdg_path}}" ] && [ -n "${XDG_DATA_DIRS##*${snap_xdg_path}:*}" ]; then
    export XDG_DATA_DIRS="${XDG_DATA_DIRS}:${snap_xdg_path}"
fi
# ###### END /etc/profile.d/apps-bin-path.sh
