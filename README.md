# My Dot Files

My config files, heavily commented.


## Installation

``` bash
# Clone the repo
$ git clone https://tomsquest@github.com/tomsquest/dotfiles.git ~/.dotfiles && cd ~/.dotfilescd ~/.dotfiles

# Create the symlinks in $HOME
$ ./install.sh
```

## Features

### ZSH

Heavily commented ZSH configuration : config, completion, prompt, key bindings...

#### Prompt

``` bash
06:42:21 ~/.dotfiles ------------------------------
$                                    (master|●1✚1…)
```

- The path is truncated if it is too long for the terminal width
- The return code of the last executed command is displayed in red to highligh a previous error
- The Git status is displayed at the right of the screen (using Olivier Verdier's Git prompt)

#### Completions

Some completions taken from https://github.com/zsh-users/zsh-completions : Bundler, Gem, Rvm

#### Functions

- o : use xdg-open to open the file with the appropriate program and ask for sudo if root privileges needed
- mcd : mkdir + cd to it
- last_modified : used in Rake and Capistrano completion to update the task caches

### ACK-GREP

Ruby/Haml/Sass configuration for Ack-grep (aliased 'ack').
ACK is a powerfull replacement for grep, written for developpers (http://betterthangrep.com/)

### GIT

* .gitignore based on https://github.com/github/gitignore
* .gitconfig with some interesting aliases

### VIM

Vim has a pretty good configuration.

Plugins, syntax, colorschemes are managed by Vundle (https://github.com/gmarik/vundle)

### Rupa's Z

[Rupa's Z](https://github.com/rupa/z) allows you to jump into previous directories.

Usage:

``` bash
$ z dot     # will jump to ~/.dotfiles from anywhere
```

## Sources

- https://github.com/ryanb/dotfiles
- https://github.com/nono/dotfiles
- http://stackoverflow.com/questions/171563/whats-in-your-zshrc
- Ubuntu: /etc/zsh/newuser.zshrc.recommended
- Git prompt: https://github.com/olivierverdier/zsh-git-prompt
- ZSH Prompt horizontal line: http://aperiodic.net/phil/prompt/
