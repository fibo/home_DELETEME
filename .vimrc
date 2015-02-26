
"""""""""""""""""""""""
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

Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'

call vundle#end()

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line
set ruler

