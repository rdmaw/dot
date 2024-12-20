set noerrorbells
set visualbell
set t_vb=
set termguicolors
set title
set nowrap
set number
set relativenumber
set autoindent
set smartindent
set breakindent
set shiftwidth=2
set tabstop=2
set smarttab
set clipboard=unnamedplus
set expandtab
set incsearch
set hlsearch
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

let mapleader = " "

nnoremap <A-v> <C-v>
inoremap jj <ESC>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-e> gg<S-v>G
nnoremap <C-d> <C-d>zz " Center cursor on Ctrl-d
nnoremap <C-u> <C-u>zz " Center cursor on Ctrl-u
nnoremap <left> <cmd>echo 'Use h to move!'<CR> " Use h to move!
nnoremap <right> <cmd>echo 'Use l to move!'<CR>
nnoremap <up> <cmd>echo 'Use k to move!'<CR>
nnoremap <down> <cmd>echo 'Use j to move!'<CR>
