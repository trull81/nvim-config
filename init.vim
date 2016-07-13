colorscheme koehler

" load plugins
execute pathogen#infect()

" ron is easier to read on vimdiff
if &diff
    colorscheme ron
endif

" syntax and indentation
syntax on
filetype plugin indent on

" general option
set number autoindent smartindent ruler showcmd history=1000
set noshowmode mouse=a laststatus=2 sw=2 ts=2 tw=80 et incsearch
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
