"
" Vundle configuration
"
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vundle
call vundle#begin('~/.vundles')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ayu-theme/ayu-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/quickfixsigns_vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
