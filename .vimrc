
" Autosource config on exit
autocmd BufLeave $MYVIMRC :source $MYVIMRC


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""
" my plugin list here

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'walm/jshint.vim'

" Needs ctags. Launch .software_install ctags
Plugin 'majutsushi/tagbar'

Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'fatih/vim-go'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum'
Plugin 'sickill/vim-monokai'

Plugin 'gabrielelana/vim-markdown'

" Color scheme goodies. F8 switches the color.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
" try also Plugin 'Taverius/vim-colorscheme-manager'

call vundle#end()

syntax enable
filetype plugin indent on " required!

"""""""""""""""""""""
" end Vundle config "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better colors when using vim from an ssh terminal
set t_Co=256

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line

set mouse=a

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my Perl preferences
au Filetype perl map <F2> :%!perltidy<CR>                    " indent whole file
au Filetype perl map <F3> :!prove -l<CR>                     " run tests
au Filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
au Filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
autocmd Filetype perl setlocal autoindent
autocmd Filetype perl setlocal shiftwidth=4
autocmd Filetype perl setlocal tabstop=4

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

