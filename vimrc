call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Make backspace work like most other apps
set backspace=2

" Basics
set tabstop=4
set ls=2
set shiftwidth=4
set expandtab
set number
set ruler

autocmd BufRead,BufNewFile *.c,*.h set tabstop=8 shiftwidth=8

set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline
set cursorcolumn

" Highlight columns above 100.
if v:version >= 703
  let &colorcolumn=join(range(101,999),",")
endif
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Start neocomplcache
let g:neocomplcache_enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif

" Solarized stuff.
syntax on
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Arrow keys im command mode are bad.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Map spacebar to save.
noremap <Space> za

" More efficient bracket creation.
inoremap {<CR> {<CR>}<Esc>O

" Fixes typos.
:command W w
" :E is no longer unique.
:command E Ex

" Match <> in html/erb files.
autocmd FileType *.html *.erb set matchpairs+=<:>

" Hotkey for Latex files.
autocmd BufNewFile,BufRead *.tex :nnoremap <leader>c :!pdflatex %; open %:r.pdf<CR>

:nmap <leader>p :set paste!<CR>
:nmap <leader>l :set list!<CR>
:nnoremap <leader>s :setlocal spell spelllang=en_us<CR>
:nnoremap <leader>w :set textwidth=80<CR>

let g:syntastic_c_checkers = ['make']

" Set up CtrlP
let g:ctrlp_map = '<leader>o'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" Mark trailing whitespace
match ErrorMsg /\s\+$/
autocmd BufWinEnter * match ErrorMsg /\s\+$/
nnoremap <Leader>k :%s/\s\+$//e<CR>

" Turn Filetype Plugin on for NerdCommenter
filetype plugin on

" Save files when window loses focus.
autocmd BufLeave,FocusLost * silent! wall

" Kill trailing spaces each write.
" autocmd BufWritePre * :%s/\s\+$//e

set foldmethod=indent
set foldlevelstart=1

" Copy to clipboard
set clipboard=unnamed

" Open QuickFix after grep
autocmd QuickFixCmdPost *grep* cwindow

" Enable the mouse
set mouse=a
