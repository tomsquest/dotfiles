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

" Utilies for Rake projets
Bundle 'tpope/vim-rake'

" Automatically insert 'end' for ruby methods
"Bundle 'tpope/vim-endwise'

" Quoting/parenthesizing made simple
"Bundle 'tpope/vim-surround'

" Simpler way to use some motions in vim.
"Bundle 'Lokaltog/vim-easymotion'

" Clearly indicate visually whether Vim is in insert mode via the StatusLine highlight group
"Bundle 'bsl/obviousmode'

" Change inside surroundings with <leader>ci
Bundle 'briandoll/change-inside-surroundings.vim'

" Display a list of buffers on top of the screen
Bundle 'fholgado/minibufexpl.vim'

" Fuzzy file, buffer, mru and tag finder
Bundle 'kien/ctrlp.vim'

" KIck-ass status bar
Bundle 'Lokaltog/vim-powerline'


"
" Syntaxes
"
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'juvenn/mustache.vim'
