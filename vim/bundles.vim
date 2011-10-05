"
"  Vundle configuration
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


"
" Custom bundles
"

" Colorsheme
Bundle 'xoria256.vim'

" Git integration into Vim
Bundle 'tpope/vim-fugitive'

" Utilities for Rails development
Bundle 'tpope/vim-rails'

" Automatically insert 'end' for ruby methods
Bundle 'tpope/vim-endwise'

" Markdown syntax
Bundle 'tpope/vim-markdown'

" Haml syntax
Bundle 'tpope/vim-haml'

" Quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" Opening files and buffers with a minimal number of keystrokes
"
" Command-T requires an additionnal installation step :
" From ~/.vim/bundle/command-t, run: rvm use 1.8.7 && bundle install && rake make
Bundle 'git://git.wincent.com/command-t.git'

" File explorer
Bundle 'scrooloose/nerdtree'

" Simpler way to use some motions in vim.
Bundle 'Lokaltog/vim-easymotion'

" Clearly indicate visually whether Vim is in insert mode via the StatusLine highlight group
Bundle 'Obvious-Mode'

