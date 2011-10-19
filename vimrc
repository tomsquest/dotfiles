" Sources :
"   http://www.derekwyatt.org/vim/the-vimrc-file/

" Forget being compatible with good ol' vi
set nocompatible

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

"
" Vundle configuration
"
source ~/.vim/bundles.vim

" Display extra whitespace
set list listchars=tab:»·,trail:·

" (Soft) Tabstops are 2 spaces
set softtabstop=2
set shiftwidth=2

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Make command line two lines high
set ch=2

" set visual bell
set vb

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

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

" Wrap line and show wraps
set wrap
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
set nu

" Lines above/below cursor when scrolling
set scrolloff=5

" Minimal columns displayed when scrolling horizontally
set sidescrolloff=5

" Enable scrolling horizontaly column by column
set sidescroll=1

" Apparence
set background=dark
set t_Co=256
colorscheme xoria256

" Highlight current line
set cursorline

" Enable the mouse
set mouse=a

" Isolate swap and backup files to a single directory
set backupdir=~/.vim/.backupdir,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/.backupdir,~/.tmp,~/tmp,/var/tmp,/tmp

"
" Mappings
"

" Map leader
let mapleader = ","

" Remap ' as ` because ` remenbers line AND column for marks
" 'a will jump to the line in the current file marked with ma
" `a will jump to the line and column marked with ma
nnoremap ' `

" By default, 0<C-e> and <C-y> scroll the viewport a single line. Speed this up:
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

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>



"
" Autoexec commands
"

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Show warning on focus when file has been modified by an external program
set updatetime=500
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
  set lines=67 columns=180
end


"
" NERDTree configuration
"

" Show/hide NERDTree
map <F1> :NERDTreeToggle<CR>

