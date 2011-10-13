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
" Colorshemes
"
Bundle 'xoria256.vim'


"
" Plugins
"

" File explorer
Bundle 'scrooloose/nerdtree'

" Utilities for common commans, adding or moving lines, encoding/decoding...
Bundle 'tpope/vim-unimpaired'

" Utilities for Rails development
Bundle 'tpope/vim-rails'

" Automatically insert 'end' for ruby methods
"Bundle 'tpope/vim-endwise'

" Quoting/parenthesizing made simple
"Bundle 'tpope/vim-surround'

" Opening files and buffers with a minimal number of keystrokes
"
" Command-T requires an additionnal installation step :
" From ~/.vim/bundle/command-t, run: rvm use 1.8.7 && bundle install && rake make
"Bundle 'git://git.wincent.com/command-t.git'

" Simpler way to use some motions in vim.
"Bundle 'Lokaltog/vim-easymotion'

" Clearly indicate visually whether Vim is in insert mode via the StatusLine highlight group
Bundle 'bsl/obviousmode'


"
" Syntax
"

" Markdown
Bundle 'tpope/vim-markdown'

" Haml
Bundle 'tpope/vim-haml'

" Slim
Bundle 'bbommarito/vim-slim'

