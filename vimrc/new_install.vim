" .vimrc
"
" Use this vimrc for NEW INSTALLS
" Plugins: /usr/share/vim/vim74/plugin
" Color-schemes: /usr/share/vim/vim74/colors

set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set encoding=utf-8

function InsertTabWrapper() 
      let col = col('.') - 1 
      if !col || getline('.')[col - 1] !~ '\k' 
          return "\<tab>" 
      else 
          return "\<c-x>\<c-n>" 
      endif 
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           SCREEN SETUP                                    "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3                         " number of lines to keep above or below the cursor
set hidden                              " buffers become hidden when abandoned
set visualbell                          " no ding, just flash the screen
set cursorline                          " hilite the cursor line
set ttyfast                             " indicates fast terminal connection
set lazyredraw                          " do not redraw screen while executing macros
set laststatus=2                        " always show the status line
set number                              " show absolute line numbers
set colorcolumn=78                      " hilite column at right-edge
set lines=25                            " for terminal
set columns=85                          " same
set guioptions-=T                       " remove toolbar (save vertical height)
set textwidth=0                         " disables automatic line-breaks
set wrapmargin=0                        " same

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                                FONT                                       "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font names differ from system to system
"set guifont=Courier_New
"set guifont=DejaVu_Sans_Mono:h11:cANSI
"set guifont=DejaVu_Sans_Mono:h11:cANSI
"set guifont=Consolas:h10:b:cANSI
set guifont="FreeMono 12"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           COLOR SCHEME                                    "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_italic=0
colors solarized
"colors desert
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           GENERAL SETUP                                   "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50		                    " keep 50 lines of command line history
set ruler		                        " show the cursor position all the time
set showcmd		                        " display incomplete commands
set incsearch		                    " do incremental searching
set nowrap                              " don't wrap lines at screen edge
set backspace=indent,eol,start          " allow backspace over everything in insert-mode

set clipboard=unnamed                   " sane clipboard behavior

set wildmenu                            " vim's built-in tab-completion
set wildmode=list:longest               " same

set mouse=a                             " In many terminal emulators the mouse works just fine, thus enable it.

syntax on                               " Turns on syntax highlighting
set hlsearch                            " Turns on search highlighting

filetype plugin indent on               " Allows filetype-based plugins

set tabstop=4                           " 1 tab = 4 spaces
set shiftwidth=4                        " move 4 spaces when tabbing
set expandtab                           " expand tabs into spaces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           BACKUP FILES                                    "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile
set noundofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           KEY MAPPINGS                                    "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: do not place line-comments after key-mappings

let mapleader = ","

" sane up/down behavior on multi-lines
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>

" hard beginning-of-line (carat already does soft BOL)
nnoremap 0 :call cursor(0,1)<CR>

" get into command mode without shift-key
nnoremap ; :

    " ,h --> substitute word under cursor from paste register
    " ,d --> clean up a C function declaration
    " ,e --> decorate a C function definition
    " ,t --> enter text-mode
"nnoremap <leader>w <C-w>v<C-w>l
"nnoremap <leader>h "_dePb
nnoremap <leader>h ea <Esc>b"_dePbel"_dl
nnoremap <leader>d 0f{Da;<Esc>0
nnoremap <leader>e ye$a // pa#0
nnoremap <leader>t :set wrap linebreak nocursorline textwidth=0 wrapmargin=0 display=lastline<CR>

" yank to end-of-line into + register (clipboard)
nnoremap <leader>y "+y$

" paste from + register (clipboard)
nnoremap <leader>p "+p
nnoremap <leader>P "+P

noremap x "_d
map xx "_dd
noremap X "_dl

noremap K J
noremap J 0i<CR><Esc>k0
noremap o g$

nmap <CR>  i<CR><Esc>l
nmap <Del> i<Del><Esc>l
nmap <BS>  i<BS><Esc>l

noremap U <C-R>

map <F9> :e ~/.vimrc<CR>
map <F6> :so ~/.vimrc<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           LINE COMMENTS                                   "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,# :s/^/#/<CR>:nohlsearch<CR> 
map ,/ :s/^/\/\//<CR>:nohlsearch<CR> 
map ,> :s/^/> /<CR>:nohlsearch<CR> 
map ," :s/^/\"/<CR>:nohlsearch<CR> 
map ,% :s/^/%/<CR>:nohlsearch<CR> 
map ,! :s/^/!/<CR>:nohlsearch<CR> 
map ,; :s/^/;/<CR>:nohlsearch<CR> 
map ,- :s/^/--/<CR>:nohlsearch<CR> 
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR> 


