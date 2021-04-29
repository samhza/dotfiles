filetype off
set shell=bash

" See https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/vim-goimports'
call plug#end()

autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType javascript setlocal et ts=4 sw=4
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType c setlocal noet ts=8 sw=8 tw=80
autocmd FileType h setlocal noet ts=8 sw=8 tw=80
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80
autocmd FileType mail setlocal noautoindent

set encoding=utf-8
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set magic " unbreak vim's regex implementation
set directory=~/.cache
set undodir=~/.cache
set undofile
set number
set scrolloff=3
set sidescroll=3
set ruler
set cc=80
set nowrap
set ignorecase
set smartcase
" Search as you type, highlight results
set incsearch
set showmatch
set hlsearch

" Resize windows and move tabs and such with the mouse
set mouse=a

" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache

set tags=./tags;

set list
set wrap
set linebreak
set breakindent
" eol:¬
set listchars=tab:▸\ ,trail:·
let &showbreak='↳ '
syntax enable
highlight Search ctermbg=12
highlight NonText ctermfg=237
highlight SpecialKey ctermfg=237
highlight clear SignColumn
highlight Comment cterm=italic ctermfg=darkgrey
highlight StatusLine cterm=none ctermbg=none ctermfg=darkgrey
highlight StatusLineNC cterm=none ctermbg=none ctermfg=darkgrey
highlight LineNR ctermfg=darkgrey
highlight Title cterm=none ctermfg=darkgrey
highlight TabLineFill cterm=none
highlight TabLine cterm=none ctermfg=darkgrey ctermbg=none
highlight ColorColumn ctermbg=234 guibg=lightgrey

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set hidden
set notimeout

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)
set title

set clipboard+=unnamedplus

let g:goimports_simplify = 1

nnoremap <C-l> :b#<cr>
nnoremap \\ :noh<cr>
nnoremap Y y$
inoremap <C-c> <ESC>
nnoremap Q <Nop>

" Colemak
noremap n j
noremap e k
nnoremap i l
vnoremap i l

nnoremap k n
nnoremap K N

nnoremap a A
nnoremap A a

nnoremap l i
nnoremap L I

nnoremap ; :

nnoremap <space>h bp
nnoremap <space>i bn

nnoremap R r
nnoremap rR R
nnoremap rt t

nnoremap 0 ^
nnoremap ^ 0

nnoremap <C-w>n <C-w>j
nnoremap <C-w>e <C-w>k
nnoremap <C-w>i <C-w>l

nnoremap th <C-w>h
nnoremap tn <C-w>j
nnoremap te <C-w>k
nnoremap ti <C-w>l
nnoremap t' <C-w>v <C-w>l
nnoremap t- <C-w>s
nnoremap tq <C-w>q
