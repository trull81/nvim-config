filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" install plugins in bundle folder
call vundle#begin('~/.config/nvim/bundle')
  " Vundle plugin manager
  Plugin 'VundleVim/Vundle.vim'

  " Git commands wrapper
  Plugin 'tpope/vim-fugitive'

  " Status bar like powerline (but full vimscript)
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Ranger integration
  Plugin 'francoiscabrol/ranger.vim'
  " Close buffer without closing window (required by Ranger)
  Plugin 'rbgrouleff/bclose.vim'

  " Autocompletion backend
  Plugin 'Shougo/deoplete.nvim'

  " Python
  Plugin 'zchee/deoplete-jedi'

  " FZF
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'

  " Multiple cursor support (CTRL-n)
  Plugin 'terryma/vim-multiple-cursors'

  " Colorscheme
  Plugin 'joshdick/onedark.vim'

  " Undo tree visualizer
  Plugin 'mbbill/undotree'
call vundle#end()
call deoplete#enable()

" syntax and indentation
syntax on
filetype plugin indent on

" general options
set number cindent ruler showcmd history=10000
set showmode mouse=a laststatus=2 incsearch inccommand=split
set cursorline wildmenu lazyredraw hlsearch listchars=eol:$

" never insert tabs but display existing tabs with 8 spaces
set shiftwidth=2 tabstop=8 expandtab

" do not trigger indentation of the current line when using #
set cinkeys-=0# indentkeys-=0#

" folding is a feature to reduce and expand code blocks
set foldmethod=indent foldlevelstart=10 foldnestmax=10

" open/close code blocks with space
nnoremap <space> za

" stop highlighting old search results
nnoremap <leader><space> :nohlsearch<CR>

" open current buffer in new tab
noremap tt :tab split<CR>

" fzf
nnoremap <leader>f :FZF<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>C :BCommits<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>L :BLines<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>T :BTags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>w :Windows<CR>

" ranger
nnoremap <leader>r :Ranger<CR>

" this will bring terminal buffer in normal mode
tnoremap <C-j>j <C-\><C-n>
tnoremap <C-j><C-j> <C-\><C-n>

" remove trailing spaces and tabs on saving
autocmd BufWritePre * :%s/\s\+$//ec

" specific file type options
augroup UserFileType
  autocmd FileType python setlocal sw=4
  autocmd FileType python set kp=:Run\ pydoc
  autocmd FileType ruby set kp=:TRun\ ri
  autocmd FileType go setlocal ts=2 noet
  autocmd FileType markdown setlocal spell
augroup end

" specific file extension options
augroup UserExtension
  autocmd BufNewFile,BufRead Thorfile\|*.thor setlocal filetype=ruby
augroup end

" close doc window (eg python jedi) when pressing ESC
autocmd InsertLeave * pclose

" airline options
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" tabline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_min_count = 2

let g:deoplete#enable_at_startup = 1

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" run commands and display output in the preview window
function RunCmd(cmd)
  silent exe "pedit " . a:cmd
  wincmd P
  set buftype=nofile
  exe "r! " . a:cmd
  1d
endfunction

" run command inside a terminal
function TermRunCmd(cmd)
  silent exe "sp term://" . a:cmd
endfunction

" export RunCmd as :Run command
command -nargs=1 Run :call RunCmd("<args>")
command -nargs=1 TRun :call TermRunCmd("<args>")

let g:onedark_color_overrides = {
\ "black": {"gui": "#1d1d2d", "cterm": "0", "cterm16": "0" },
\ "comment_grey": {"gui": "#6d7d7d", "cterm": "0", "cterm16": "0" },
\ "white": {"gui": "#bdcdcd", "cterm": "0", "cterm16": "0" },
\}

set termguicolors
colorscheme onedark
