" .vimrc
"
" FULL FEATURED vimrc
"
" Plugins:
"   pathogen.vim
"   dragvisuals.vim
"   neatstatus.vim
"   mark.vim
"   easymotion.vim
"
" /usr/share/vim/vim74/plugin
" /usr/share/vim/vim74/colors

set nocompatible
set shortmess+=|

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set encoding=utf-8


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
set t_Co=256

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
"                               FOLDING                                     "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fdm=indent
"set fdm=syntax
set foldcolumn=1
set foldmethod=syntax
set foldlevel=20

highlight FoldColumn  gui=bold    guifg=grey65       guibg=Grey90
highlight Folded      gui=bold    guifg=DarkBlue     guibg=Grey80


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
map <F2> :e ~/.vim/vim_tips.txt<CR>

"    zz - center cursor on screen
"    Ctrl + e - move screen down one line (without moving cursor)
"    Ctrl + y - move screen up one line (without moving cursor)
"    Ctrl + b - move back one full screen
"    Ctrl + f - move forward one full screen
"    Ctrl + d - move forward 1/2 a screen
"    Ctrl + u - move back 1/2 a screen

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        _____    _        _    _    _____   _____   _   _    _____         "
"       |  __ \  | |      | |  | |  / ____| |_   _| | \ | |  / ____|        "
"       | |__) | | |      | |  | | | |  __    | |   |  \| | | (___          "
"       |  ___/  | |      | |  | | | | |_ |   | |   | . ` |  \___ \         "
"       | |      | |____  | |__| | | |__| |  _| |_  | |\  |  ____) |        "
"       |_|      |______|  \____/   \_____| |_____| |_| \_| |_____/         "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           DRAG VISUALS                                    "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                           NEAT STATUSLINE                                 "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default color-scheme:
"let g:NeatStatusLine_color_normal   = 'guifg=#000000 guibg=#7dcc7d gui=NONE ctermfg=0   ctermbg=2  cterm=NONE'
"let g:NeatStatusLine_color_insert   = 'guifg=#ffffff guibg=#ff0000 gui=bold ctermfg=15  ctermbg=9  cterm=bold'
"let g:NeatStatusLine_color_visual   = 'guifg=#ffffff guibg=#810085 gui=NONE ctermfg=15  ctermbg=53 cterm=NONE'
"let g:NeatStatusLine_color_replace  = 'guifg=#ffff00 guibg=#5b7fbb gui=bold ctermfg=190 ctermbg=67 cterm=bold'
"let g:NeatStatusLine_color_modified = 'guifg=#ffffff guibg=#ff00ff gui=bold ctermfg=15  ctermbg=5'

let g:NeatStatusLine_color_normal   = 'guifg=#000000 guibg=#00cc00 gui=NONE ctermfg=0   ctermbg=2  cterm=NONE'
let g:NeatStatusLine_color_insert   = 'guifg=#000000 guibg=#cccc00 gui=bold ctermfg=15  ctermbg=9  cterm=bold'
let g:NeatStatusLine_color_visual   = 'guifg=#ffffff guibg=#0000cc gui=NONE ctermfg=15  ctermbg=53 cterm=NONE'
let g:NeatStatusLine_color_replace  = 'guifg=#ffffff guibg=#cc0000 gui=bold ctermfg=190 ctermbg=67 cterm=bold'
let g:NeatStatusLine_color_modified = 'guifg=#000000 guibg=#ff00ff gui=bold ctermfg=15  ctermbg=5'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                                MARK.VIM                                   "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use <leader>m to make a mark
"     <leader>n to clear marks
" use n/N to navigate as with regular highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                           "
"                               EASY MOTION                                 "
"                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These are the only commands you need:
" use <leader><leader>w to move to a word-beginning
" use <leader><leader>e to move to a word-ending
" use <leader><leader>s to search anywhere for a single character

" For reference
" use <leader><leader>f to search forward for a single character
" use <leader><leader>F to search backward for a single character
" use <leader><leader>j to search down for a line
" use <leader><leader>k to search up for a line



