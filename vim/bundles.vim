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

" Ruby support
Plugin 'vim-ruby/vim-ruby'

" Utilities for common commans, adding or moving lines, encoding/decoding...
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

"
" Syntaxes
"
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'juvenn/mustache.vim'
Plugin 'othree/html5.vim'
Plugin 'sunaku/vim-ruby-minitest'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
