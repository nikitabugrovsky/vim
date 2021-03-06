call plug#begin("~/.vim/plugged")

"Make sure you use single quotes
"Regular Loading
Plug 'tpope/vim-fugitive'
Plug 'townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'miyakogi/conoline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'bronson/vim-trailing-whitespace'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'

"On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Initialize plugin system
call plug#end()
"map NERD Tree
map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
"remap splits navigation
let mapleader = "\<Space>"
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"easy empty lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

set nocompatible
colorscheme monokai

"indentline
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '·'
let g:indentLine_concealcursor = ''

"shfmt
let g:shfmt_extra_args = '-i 2'
let g:shfmt_fmt_on_save = 1

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
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_sh_checkers = ['shfmt', 'shellcheck']
let g:syntastic_yaml_checkers = ['yamllint']

let g:xml_syntax_folding = 1
let g:conoline_auto_enable = 1
let g:airline_theme='base16_monokai'
syntax on
let python_highlight_all=1
filetype plugin on
filetype indent on
set nofoldenable

"history and backup
set history=50
set backup
set backupdir=~/.vim/vimbackup/
set directory=~/.vim/vimswaps/

"tabs
"use :retab to re indent files
"set list shows you tabs
set list
autocmd FileType yaml nnoremap <buffer> <F2> :call YamlPrettyPrint()<CR>
func! YamlPrettyPrint()
    execute "normal! mz"
    if executable('yamlfmt')
        execute "%!yamlfmt"
    endif
    execute "normal! 'z"
endfunc
autocmd FileType json nnoremap <buffer> <F2> :call JsonPrettyPrint()<CR>
func! JsonPrettyPrint()
    execute "normal! Ms"
    if executable('python3')
        %!python3 -m json.tool
    elseif executable('python2')
        %!python2 -m json.tool
    elseif executable('python')
        %!python -m json.tool
    else
        %!jq .
    endif
    execute "normal! 'z"
endfunc
set formatoptions=t
set encoding=utf-8
set hlsearch
set incsearch
set visualbell
"set noerrorbells
"editor
set visualbell
set ttyfast
set number
set ruler
set colorcolumn=80
set cursorline
set autoindent
set expandtab
"set smarttab
"set smartindent
set whichwrap=<,>,h,l
set backspace=2
set wildmenu
"matching brackets
set showmatch
set matchtime=3
"Spellcheck
nnoremap <F3> :call FixLastSpellingError()<CR>
func! FixLastSpellingError()
    normal! mm[s1z=`m
endfunc
"setlocal spell spelllang=en_us
"Remove trailing white space when saving file
autocmd BufWrite * :call DeleteTrailingWhiteSpace()
func! DeleteTrailingWhiteSpace()
    execute "normal mz"
    %s/\s\+$//ge
    execute "normal 'z"
endfunc
"JS workaraund
:au FileType js,javascript setlocal shiftwidth=2 softtabstop=2
"Templates
autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
"Proper shebang for python
autocmd BufNewFile *.py :call SetPythonShebang()
func! SetPythonShebang()
    if executable('python3')
        %s/insertinterpreterhere/python3/
    elseif executable('python2')
        %s/insertinterpreterhere/python2/
    else
        %s/insertinterpreterhere/python/
    endif
endfunc
autocmd BufNewFile *.sh :call SetShellShebang()
func! SetShellShebang()
    %s/insertinterpreterhere/\=split(expand("$SHELL"), "\/")[-1]/
endfunc
autocmd BufNewFile *.sh,*.py,*.rb :call PopulateTemplate()
func! PopulateTemplate()
    call CreatedAtTimestamp()
    call MaintainerEmailAddress()
    call MaintainerName()
    execute "normal GA"
endfunc
func! CreatedAtTimestamp()
    %s/inserttimestamphere/\=strftime("%c")/
endfunc
func! MaintainerEmailAddress()
    %s/insertemailhere/\=expand("$MAINTAINER_EMAIL")/
endfunc
func! MaintainerName()
    %s/insertmaintainerhere/\=expand("$MAINTAINER_NAME")/
endfunc
"Set scripts to be executable from the shell
autocmd BufWritePre *.sh,*.py,*.rb :call MakeFileExecutable()
func! MakeFileExecutable()
    if getline(1) =~ "^#!" || getline(1) =~ "^# !"
        if getline(1) =~ "/bin/"
            silent execute "!chmod 0755 <afile>"
        endif
    endif
endfunc
