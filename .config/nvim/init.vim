" neovim config
call plug#begin('~/.local/share/nvim/plugged')

plug 'davidhalter/jedi-vim'
plug 'shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
plug 'zchee/deoplete-jedi'
plug 'vim-airline/vim-airline'
plug 'arcticicestudio/nord-vim'
plug 'jiangmiao/auto-pairs'
plug 'scrooloose/nerdcommenter'
plug 'bronson/vim-trailing-whitespace'
plug 'sbdchd/neoformat'
plug 'scrooloose/nerdtree'
plug 'neomake/neomake'
plug 'machakann/vim-highlightedyank'
plug 'tmhedberg/simpylfold', { 'on': [] }
plug 'yggdroot/indentline'
plug 'airblade/vim-gitgutter'
plug 'majutsushi/tagbar'
plug 'edkolev/promptline.vim', { 'on': [] }
plug 'pearofducks/ansible-vim'

call plug#end()

" nerdtree  show hidden files
let nerdtreeshowhidden=1
" deoplete config
let g:deoplete#enable_at_startup = 1
" deoplete-jedi config
" close preview window automatically
autocmd insertleave,completedone * if pumvisible() == 0 | pclose | endif
" navigate autocompletion window with tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" neoformat config
" enable alignment
let g:neoformat_basic_format_align = 1
" enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" jedi config
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
" neomake config
" setting code checker to flake8
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
" colorscheme
colorscheme nord
" highlightedyank config, should be added after colorscheme
hi highlightedyankregion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000
" indentline config
let g:indentline_leadingspaceenabled = 1
let g:indentline_leadingspacechar = '·'
let g:indentline_char = '·'
let g:indentline_concealcursor = ''
" set space as a leader key
nnoremap <space> <nop>
let mapleader=" "
" add cursor line
set cursorline
" add line numbers
set number
" add ruler
set ruler
" add 80 characters indication
set colorcolumn=80
" shortcuts
nmap <leader>t :terminal<cr>
nmap <f2> :neoformat<cr>
nmap <f7> :nerdtreetoggle<cr>
nmap <f8> :tagbartoggle<cr>
" indent in git commit
au filetype gitcommit setlocal tw=72
au filetype gitcommit setlocal cc=+1
" easy empty lines
map <enter> o<esc>
map <s-enter> o<esc>

