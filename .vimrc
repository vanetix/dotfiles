colorscheme molokai
let g:molokai_original = 1

" Leader
let mapleader = ","
" base Settings
syntax on
set noswapfile
" better vim
set nocompatible
" show line numbers
set number
set numberwidth=5
" dont add a new line at the end of files
set binary

" filetypes
filetype on
filetype plugin on
filetype indent on

set hidden
set lazyredraw
" show the current mode
set showmode
" command line completion
set wildmenu

" highlight current line
set cursorline

" highlight searches
set hlsearch
" ignore case of searches
set ignorecase
" highlight dynamically as pattern is typed
set incsearch
" wrap searches
set wrapscan

" make the command bar 2 lines high
set ch=2      
" use visual bell rather than beep
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" gvim options
set guioptions=ac

set timeoutlen=500

set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all
" completion options
set complete=.,w,b,t

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Clear search highlighting
nnoremap <CR> :noh<CR><CR>

" pretty things
set mouse=a
set showcmd
set title

" Change the cursor so it's easy to find
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Strip whitespace with ,s
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

map <leader>s :call StripWhitespace ()<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>
