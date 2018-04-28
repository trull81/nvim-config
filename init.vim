" nocompatible ignored by Neovim but required when using Bundle with Vim
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" install plugins in bundle folder
call vundle#begin('~/.config/nvim/bundle')
  " Vundle plugin manager
  Plugin 'VundleVim/Vundle.vim'

  " Buffer explorer
  Plugin 'fholgado/minibufexpl.vim'

  " Git commands wrapper
  Plugin 'tpope/vim-fugitive'

  " Status bar like powerline (but full vimscript)
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Ranger integration
  Plugin 'francoiscabrol/ranger.vim'
  " Close buffer without closing window (required by Ranger)
  Plugin 'rbgrouleff/bclose.vim'

  " Show variables and methods and other components of source files
  Plugin 'majutsushi/tagbar'

  " Autocompletion backend
  Plugin 'Shougo/deoplete.nvim'

  " Python
  Plugin 'zchee/deoplete-jedi'

  " Ruby
  Plugin 'fishbullet/deoplete-ruby'

  " FZF
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
call vundle#end()
call deoplete#enable()

" syntax and indentation
syntax on
filetype plugin indent on

" general option
set termguicolors
set number cindent ruler showcmd history=1000
set showmode mouse=a laststatus=2 sw=2 ts=2 et incsearch
set cursorline wildmenu lazyredraw hlsearch listchars=eol:$

" do not trigger indentation of the current line when using #
set cinkeys-=0# indentkeys-=0#

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

" open current buffer in new tab
noremap tt :tab split<CR>

" fzf
nnoremap <leader>f :FZF<CR>

" ranger
nnoremap <leader>r :Ranger<CR>

" this will bring terminal buffer in normal mode
tnoremap <C-j>j <C-\><C-n>

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

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

let g:ranger_map_keys = 0

" close doc window (eg python jedi) when pressing ESC
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

colorscheme guardian2
