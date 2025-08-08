let mapleader =" "

set visualbell
set t_vb=
set termguicolors
set clipboard=unnamedplus
set number
set relativenumber
set nowrap
set autoindent
set smartindent
set breakindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set hidden
set incsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set splitkeep=cursor
set mouse=v
set scrolloff=8
set sidescrolloff=30
set noswapfile
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*

inoremap jj <ESC>
nnoremap <C-e> gg<S-v>G " Visually select all
nnoremap <C-d> <C-d>zz " Center cursor on Ctrl-d
nnoremap <C-u> <C-u>zz " Center cursor on Ctrl-u

packadd! matchit

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme gruvbox
