" nocompatible ignored by Neovim but required when using Bundle with Vim
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" install plugins in bundle folder
call vundle#begin('~/.config/nvim/bundle')

Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvie/vim-flake8'
Plugin 'digitaltoad/vim-pug'
Plugin 'scrooloose/nerdtree.git'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/deoplete-rct'
Plugin 'zchee/deoplete-jedi'
Plugin 'fishbullet/deoplete-ruby'

call vundle#end()
call deoplete#enable()

colorscheme guardian2

" syntax and indentation
syntax on
filetype plugin indent on

" general option
set termguicolors
set number autoindent smartindent ruler showcmd history=1000
set noshowmode mouse=a laststatus=2 sw=2 ts=2 et incsearch
set cursorline wildmenu lazyredraw hlsearch listchars=eol:$

" folding is a feature to reduce and expand code blocks
set foldmethod=indent foldlevelstart=10 foldnestmax=10

" open/close code blocks with space
nnoremap <space> za

" comma is the mapleader
let mapleader = ","

" stop highlighting old search with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" save session with ,s
nnoremap <leader>s :mksession!<CR>

" remove trailing spaces and tabs on saving
autocmd BufWritePre * :%s/\s\+$//ec

" specific filetype option
augroup filetype
  autocmd FileType python setlocal ts=4 sw=4
  autocmd FileType go setlocal ts=8 sw=8
  autocmd FileType markdown setlocal spell
augroup end

" suggestion bar color
hi StatusLine ctermfg=15 ctermbg=0

" airline options
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

" tabline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_min_count = 2

let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
