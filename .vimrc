call plug#begin("~/.vim/plugged")

" Make sure you use single quotes
" Regular Loading
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'miyakogi/conoline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'hashivim/vim-vagrant', { 'for': 'ruby' }

" Initialize plugin system
call plug#end()
" map NERD Tree
map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
" remap splits navigation
let mapleader = "\<Space>"
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" easy empty lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

set nocompatible
colorscheme monokai

"youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

let g:xml_syntax_folding = 1
let g:conoline_auto_enable = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme='base16_monokai'
syntax on
let python_highlight_all=1
filetype plugin on
set nofoldenable

"history and backup
set history=50
set backup
set backupdir=~/.vim/vimbackup/
set directory=~/.vim/vimswaps/

"tabs
"use :retab to reindent files
"set list shows you tabs
set list
" PEP8 compliant indent
au BufNewFile, BufRead *.py
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
            \ set expandtab
            \ set autoindent
            \ set fileformat=unix

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"end tabs
set formatoptions=t
set encoding=utf-8
set hlsearch
set incsearch
set visualbell
set noerrorbells
"editor
set number
set ruler
set cursorline
set colorcolumn=80
set autoindent
set smartindent
set whichwrap=<,>,h,l
set backspace=2
set wildmenu
" matching brackets
set showmatch
set matchtime=3
"Remove all trailing whitespace by pressing <Fn-F2>
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F3> :retab
