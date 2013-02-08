call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set tabstop=2
set ls=2
set shiftwidth=2
set expandtab
set number
set ruler 

set autoindent
set smartindent

set hlsearch
set incsearch

syntax on
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

:command W w
:command E Ex

set matchpairs+=<:>
