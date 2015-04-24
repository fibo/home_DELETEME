
" Autosource config on exit
autocmd BufLeave $MYVIMRC :source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start Vundle config "
"""""""""""""""""""""""
set nocompatible      " be iMproved
filetype off          " required!
"""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""""
" my plugin list here

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'walm/jshint.vim'

Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'

" Needs ctags. Launch .software_install ctags
Plugin 'majutsushi/tagbar'

Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Languages
Plugin 'AndrewRadev/vim-eco'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'gabrielelana/vim-markdown'
Plugin 'nikvdp/ejs-syntax'


" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum'
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'

" Color scheme goodies. F8 switches the colorscheme.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
" try Plugin 'Taverius/vim-colorscheme-manager'

call vundle#end()

syntax enable
filetype plugin indent on " required!

"""""""""""""""""""""
" end Vundle config "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set gvim window size
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" See http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=40 columns=177
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use UTF-8 encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set termencoding=utf-8
set fileencodings=        " no encoding conversion
set guifontwide=MingLiU:h10
set guifont=Consolas:h11:cANSI

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set nowrap
set list

" Define characters to show when you show formatting
set listchars=tab:\|\ ,trail:☠,extends:>,precedes:<,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More natural split opening
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smarttab   " insert tabs on the start of a line according to
               "   shiftwidth, not tabstop
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set smartcase  " ignore case if search pattern is all lowercase,
               "   case-sensitive otherwise
set ignorecase " ignore case when searching

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cursorcolumn
set cursorline
"if version >= 703
if exists('+colorcolumn')
  set colorcolumn=80
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier split navigations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better colors when using vim from an ssh terminal
set t_Co=256
" My favourite colorscheme
colorscheme bubblegum-256-dark

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line

set mouse=a

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my JavaScript preferences
autocmd Filetype javascript setlocal autoindent
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype javascript setlocal softtabstop=2
autocmd Filetype javascript setlocal expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my Perl preferences
au Filetype perl map <F2> :%!perltidy<CR>                    " indent whole file
au Filetype perl map <F3> :!prove -l<CR>                     " run tests
au Filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
au Filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
autocmd Filetype perl setlocal autoindent
autocmd Filetype perl setlocal shiftwidth=4
autocmd Filetype perl setlocal softtabstop=4
autocmd Filetype perl setlocal expandtab

" use perltidy for .pl, .pm, and .t
autocmd BufRead,BufNewFile *.pl setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.PL setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.pm setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.t  setlocal equalprg=perltidy


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format Go source files when they are saved
autocmd FileType go autocmd BufWritePre <buffer> GoFmt

" gocode: An autocompletion daemon for the Go programming language
" See https://github.com/nsf/gocode and
" https://github.com/Blackrush/vim-gocode
"
" Use <C-x><C-o> for autocompletion (omnifunc autocompletion)
"
" Bundle 'Blackrush/vim-gocode'
