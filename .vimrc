" Autosource config on exit
"""
autocmd BufLeave $MYVIMRC :source $MYVIMRC

" Use UTF-8 encoding
"""
set encoding=utf8
set termencoding=utf-8
set fileencodings=     " no encoding conversion

" Better colors when using vim from an ssh terminal
set t_Co=256

set number

" It is ok to wrap lines, just use gj or gk to move
set wrap

" More natural split opening
"""
set splitbelow
set splitright

" Better search
"""
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
" ignore case if search pattern is all lowercase,
set smartcase  " case-sensitive otherwise
set ignorecase " ignore case when searching

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enhanced cursor
"""
set cursorcolumn
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80
endif

" History
"""""""""
set history=1000    " remember more commands and search history
set undolevels=1000 " use many much levels of undo

" Use current file directory as a start to find file to edit
"""
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
" credits to:
" https://stackoverflow.com/a/1708936


" disable beeping and flashing
" see http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=

" Credits: @nobleach in this HN thread
" https://news.ycombinator.com/item?id=19742599
inoremap jk <esc>
" ... and why not this?
inoremap uu <esc>
inoremap kj <esc>

" console.log hot key: type cll
"""
" insert mode, puts focus inside parentheses
imap cll console.log()<Esc><S-f>(a
" from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" from normal mode, wraps word under cursor
nmap cll yiwocll<Esc>p
" credits to:
" https://gist.github.com/jasongonzales23/6189da1d82ee05a91edfd53403d6941d

" Vundle config
"""""""""""""""

set nocompatible      " be iMproved
filetype off          " required!

" avoid issues on some plugins if we use some shell other than bash
set shell=/bin/sh
"""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My plugin list here:

Plugin 'tpope/vim-commentary'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'mileszs/ack.vim'

Plugin 'bling/vim-airline'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'kien/ctrlp.vim'

" Color scheme
Plugin 'baskerville/bubblegum'

call vundle#end()

syntax enable
filetype plugin indent on " required!

" Vundle config end
"""""""""""""""""""

" Plugins configuration
"""""""""""""""""""""""

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" My favourite colorscheme
try
  colorscheme bubblegum-256-dark
catch
  colorscheme desert
endtry

" load local vimrc, if any
"""
try
  source ~/.local/vimrc
catch
endtry

