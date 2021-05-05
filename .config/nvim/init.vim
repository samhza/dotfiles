filetype off
set shell=bash


" See https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
set completeopt=menuone,noinsert

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

noremap o :
noremap ; o
noremap : O

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
