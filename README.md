# My Dot Files

My config files, heavily commented.

## Prerequisites

1. Linux brew
2. `sudo apt install safe-rm ruby libnotify-bin jq httpie xclip imwheel htop tree`

## Installation

``` bash
git clone https://tomsquest@github.com/tomsquest/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Main features

* Heavily commented ZSH configuration: completion, prompt, key bindings...
* Efficient ZSH Prompt with horizontal separator:

 ``` bash
06:42:21 /home/tom/.dotfiles ------------------------------
$                                            (master|●1✚1…)
```

- ZSH plugins with [Zgen](https://github.com/tarjoilija/zgen)
- Vim config, using [Vundle](https://github.com/gmarik/vundle)
- Bash ["Sensible" config](https://github.com/mrzool/bash-sensible)
- Search file and directories with [Fzf](https://github.com/junegunn/fzf)
- Git config
- etc...
