" Forget being compatible with good ol' vi
set nocompatible

" Default encoding
set encoding=utf-8

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

"
" Vundle configuration
"
source ~/.vim/vundle-config.vim

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Tabs are shown as 2 spaces
set softtabstop=2
set shiftwidth=2

" When 'Search next' reach the end of the file, it wraps around the beginning
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Command line height
set ch=2

" set visual bell
set vb

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Keep some stuff in the history
set history=100

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" don't initially wrap
set nowrap

" When wrap is on, show breaks with symbol
let &showbreak = '↳ '

" Indent lines
set autoindent
set smartindent

" Turn tabs into spaces
set expandtab

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Display line number
set number

" Lines above/below cursor when scrolling
set scrolloff=5

" Minimal columns displayed when scrolling horizontally
set sidescrolloff=5

" Enable scrolling horizontally column by column
set sidescroll=1

" Apparence
set t_Co=256
set termguicolors
let ayucolor="light"
colorscheme ayu

" Highlight current line
set cursorline

" Enable the mouse
set mouse=a
set ttymouse=xterm2

" Merge selection and system clipboard
set clipboard=unnamedplus,unnamed,autoselect,exclude:cons\|linux

" Isolate swap and backup files from current file
set backupdir=~/.vimbackupdir,/tmp
set directory=~/.vimbackupdir,/tmp

" Yes, we have a fast terminal
set ttyfast

" Move the cursor to the matching pair of (){}[]
set showmatch

" Indent to the nearest tabstop when using > and <
set shiftround


"
" Mappings
"

" Map leader
let mapleader = ","

" Remap ' as ` because ` remembers line AND column for marks
" 'a will jump to the line in the current file marked with ma
" `a will jump to the line and column marked with ma
nnoremap ' `

" By default, <C-e> and <C-y> scroll the viewport a single line. Speed this up:
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" set text wrapping toggles
nmap <silent> <Leader>w :setl invwrap<CR>:setl wrap?<CR>

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Show/Hide search highlighting
map <Leader>l :setl hlsearch!<CR>

" Edit vimrc file (mnemonic for the key sequence is 'e'dit 'v'imrc)
nmap <silent> <Leader>ev :e $MYVIMRC<CR>

" Source vimrc file (mnemonic for the key sequence is 's'ource 'v'imrc)
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Ctrl-s for saving.
" Needs in the shell: stty -ixon -ixoff
nmap <C-s> :update<CR>
vmap <C-s> <C-c>:update<CR>
imap <C-s> <C-o>:update<CR>

" Using vim-impaired, enable moving lines
" - Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" - Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Indent/unindent visual mode selection
vmap <tab> >gv
vmap <S-tab> <gv

" Easy navigation between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Smart lines join
set formatoptions+=j

"
" Autoexec commands
"

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Show warning on focus when file has been modified by an external program
set updatetime=100
au BufWinEnter * checktime

" Enhance % for matching if/end/tags in some language (html, jsp...)
runtime macros/matchit.vim


"
" GVim configuration
"
if has('gui_running')
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 10

  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m

  " Window size
  set lines=50 columns=120
end


"
" File explorer config
"

" Show/hide
"map <F1> :Vex<CR>
"
" Use tree-mode as default view
let g:netrw_liststyle=3
" Open file in previous buffer
let g:netrw_browse_split=4
" preview window shown in a vertically split
let g:netrw_preview=1

"
" CtrlP
"

" Opens buffer list
map <Leader>b :CtrlPBuffer<CR>
" Some more ignored dirs
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\target$\|\.class$\|\.settings$'
" Increase windows height
let g:ctrlp_max_height = 30

