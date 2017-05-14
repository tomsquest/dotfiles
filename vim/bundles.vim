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

" Utilities for common commands, adding or moving lines, encoding/decoding...
Plugin 'tpope/vim-unimpaired'

" Change inside surroundings with <leader>ci
Plugin 'briandoll/change-inside-surroundings.vim'

" Fuzzy file, buffer, mru and tag finder
Plugin 'kien/ctrlp.vim'

" Status bar
Plugin 'Lokaltog/vim-powerline'

" Mark quickfix & location list items with signs 
Plugin 'tomtom/quickfixsigns_vim'

" Language pack
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
