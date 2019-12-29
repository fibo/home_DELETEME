set encoding=UTF-8

syntax on

set number

" Better search
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase " ignore case when searching

set cursorline
set cursorcolumn

" it is ok to wrap lines, just use gj or gk to move
set wrap

" Enable mouse
set mouse=a

" Open terminal in footer
nnoremap <leader>t :below 10sp term://$SHELL<cr>i
" <Esc> to exit from terminal mode
:tnoremap <Esc> <C-\><C-n>

:nnoremap gb :bnext<CR>

source ~/.config/nvim/plugins.vim
