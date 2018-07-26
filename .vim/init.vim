set background=dark
colorscheme solarized

" Add FZF install directory
set rtp+=/usr/local/opt/fzf

" Enable solarized
let g:solarized_termtrans = 1

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Leader
let mapleader = ","
" base Settings
set noswapfile
" better vim
set nocompatible

" show line numbers
set number
set numberwidth=4
set encoding=utf8

" set default indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Pathogen
execute pathogen#infect()

" filetypes
syntax on
filetype on
filetype plugin indent on

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
" set ch=2
" use visual bell rather than beep
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Visually select text again after indentation
:vmap < <gv
:vmap > >gv

" Nerdtree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

" Tagbar
noremap <F3> :TagbarToggle<cr>
inoremap <F3> <esc>:TagbarToggle<cr>

" Ignore files
let NERDTreeIgnore=['.git', 'node_modules', 'bower_components', 'elm-stuff', 'tmp', 'deps', '_build']

set foldenable
set foldlevelstart=8
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set foldmethod=syntax
nnoremap <space> za

" Keep current line 6 lines from top of bottom
set scrolloff=6

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" completion options
set complete=.,w,b,t

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Move through buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Move windows with C+[j-l]
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map ESC in terminal to escape
":tnoremap <Esc> <C-\><C-n>

" Map Backspace to last buffer
nnoremap <BS> <C-^>

nnoremap <leader>w :up<cr>


" pretty things
set mouse=a
set showcmd
set title

" Strip whitespace with ,s
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

map <leader>s :call StripWhitespace ()<CR>

autocmd BufWritePre * :call StripWhitespace()

" Configure tagbar
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

" Language Server Configuration
let g:LanguageClient_serverCommands = {
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ }

" fzf Configuration
let g:rg_find_command = 'rg --follow --color=always --no-heading --line-number --smart-case '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_find_command.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:60%'), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

noremap <silent> <C-o> :Rg<return>
noremap <silent> <C-p> :Files<return>
noremap <silent> <C-b> :Buffers<cr>

" Auto open nerdtree only if no files passed
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

au VimEnter * call StartUp()
