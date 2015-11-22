"
"  Vundle configuration
"
set nocompatible
filetype off

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"
" Colorshemes
"
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

"
" Plugins
"

" Comment
Plugin 'tomtom/tcomment_vim'

" Utilities for common commands, adding or moving lines, encoding/decoding...
Plugin 'tpope/vim-unimpaired'

" Utilities for Rails development
Plugin 'tpope/vim-rails'

" Utilies for Rake projets
Plugin 'tpope/vim-rake'

" Automatically insert 'end' for ruby methods
"Plugin 'tpope/vim-endwise'

" Quoting/parenthesizing made simple
"Plugin 'tpope/vim-surround'

" Simpler way to use some motions in vim.
"Plugin 'Lokaltog/vim-easymotion'

" Clearly indicate visually whether Vim is in insert mode via the StatusLine highlight group
"Plugin 'bsl/obviousmode'

" Change inside surroundings with <leader>ci
Plugin 'briandoll/change-inside-surroundings.vim'

" Display a list of buffers on top of the screen
"Plugin 'fholgado/minibufexpl.vim'

" Fuzzy file, buffer, mru and tag finder
Plugin 'kien/ctrlp.vim'

" Status bar
Plugin 'Lokaltog/vim-powerline'

" Mark quickfix & location list items with signs 
Plugin 'tomtom/quickfixsigns_vim'

" Ack-grep: usage: :Ack foobar
Plugin 'mileszs/ack.vim'

" Syntax and i_CTRL-X_CTRL-U completion for MiniTest
Plugin 'sunaku/vim-ruby-minitest'

" Language pack
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
