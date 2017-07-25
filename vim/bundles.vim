"
"  Vundle configuration
"
set nocompatible
filetype off

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
Plugin 'tpope/vim-unimpaired'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tomtom/quickfixsigns_vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
