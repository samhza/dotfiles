filetype off
set shell=bash

" See https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
call plug#end()

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_lint_delay = 0
let g:ale_go_gopls_init_options = {"gopls.completeUnimported": v:true}
let g:ale_linters = {
			\ 'go':         [ "gopls" ],
			\ }
let g:ale_fixers = {
			\ 'go':         [ "goimports" ],
			\ }

syntax enable
highlight Search ctermbg=12
highlight NonText ctermfg=darkgrey
highlight SpecialKey ctermfg=darkgrey
highlight clear SignColumn
highlight Comment cterm=bold ctermfg=none
highlight StatusLine cterm=none ctermbg=none ctermfg=darkgrey
highlight StatusLineNC cterm=none ctermbg=none ctermfg=darkgrey
highlight Title cterm=none ctermfg=darkgrey
highlight TabLineFill cterm=none
highlight TabLine cterm=none ctermfg=darkgrey ctermbg=none
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey
highlight jsParensError ctermbg=NONE
highlight Todo ctermbg=NONE ctermfg=red cterm=bold
highlight PreProc ctermfg=grey
highlight String ctermfg=darkblue cterm=italic
highlight Type ctermfg=darkblue
highlight lineNr ctermfg=grey cterm=italic
highlight cIncluded ctermfg=NONE cterm=bold
highlight pythonInclude ctermfg=blue
highlight pythonConditional ctermfg=darkcyan
highlight pythonBuiltin ctermfg=darkcyan
highlight Pmenu ctermbg=white ctermfg=black
highlight PmenuSel ctermbg=darkcyan ctermfg=black
highlight hareKeyword ctermbg=NONE ctermfg=darkcyan

autocmd FileType go setlocal noet ts=4 sw=4 tw=80
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
syntax off


set hidden
set notimeout

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)
set title

set clipboard+=unnamedplus

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

noremap ; :

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
