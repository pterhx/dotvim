call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set tabstop=2
set ls=2
set shiftwidth=2
set expandtab
set number
set ruler 

autocmd BufRead,BufNewFile *.c,*.h set tabstop=8 shiftwidth=8

set autoindent
set smartindent

set hlsearch
set incsearch

set cursorline
set cursorcolumn

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

" More efficient bracket creation.
inoremap {<CR> {<CR>}<Esc>O

" Fixes typos.
:command W w
:command X x
" :E is no longer unique.
:command E Ex

" append a semicolon
nnoremap <leader>; A;<Esc>

" Match <> in html/erb files.
autocmd FileType *.html *.erb set matchpairs+=<:>

" Auto format in c files.
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -A8jps8H

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

" Status Line {  
  set laststatus=2                             " always show statusbar  
  set statusline=  
  set statusline+=%-10.3n\                     " buffer number  
  set statusline+=%f\                          " filename   
  set statusline+=%h%m%r%w                     " status flags  
  set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
  set statusline+=%=                           " right align remainder  
  set statusline+=0x%-8B                       " character value  
  set statusline+=%-14(%l,%c%V%)               " line, character  
  set statusline+=%<%P                         " file position  
"}  
