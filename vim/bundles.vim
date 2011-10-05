"
"  Vundle configuration
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'xoria256.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Command-T requires an additionnal installation step :
" From ~/.vim/bundle/command-t, run: rvm use 1.8.7 && bundle install && rake make
Bundle 'git://git.wincent.com/command-t.git'

