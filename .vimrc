
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

" if you are using vim from an ssh terminal, probably you should uncomment the line below
set t_Co=256

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line


set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my Perl preferences
autocmd filetype perl map <F2> :%!perltidy<CR>                    " indent whole file
autocmd filetype perl map <F3> :!prove -l<CR>                     " run tests
autocmd filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
autocmd filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
autocmd filetype perl setlocal autoindent
autocmd filetype perl setlocal shiftwidth=4
autocmd filetype perl setlocal tabstop=4

" use perltidy for .pl, .pm, and .t
au BufRead,BufNewFile *.pl setl equalprg=perltidy
au BufRead,BufNewFile *.PL setl equalprg=perltidy
au BufRead,BufNewFile *.pm setl equalprg=perltidy
au BufRead,BufNewFile *.t  setl equalprg=perltidy


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

