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

Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'

Plugin 'ervandew/supertab'

Plugin 'tpope/vim-commentary'

Plugin 'mhinz/vim-startify'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'mileszs/ack.vim'

Plugin 'bling/vim-airline'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'myusuf3/numbers.vim'

" Usage: cs'` inside 'Hello world' transforms it to `Hello world`
Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/auto-pairs-gentle'

Plugin 'alvan/vim-closetag'

Plugin 'mattn/emmet-vim'

Plugin 'kien/ctrlp.vim'

Plugin 'elzr/vim-json'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx' " requires pangloss/vim-javascript

Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'

" Jekyll

Plugin 'tpope/vim-liquid'

" Markdown

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' " requires godlygeek/tabular

" Color scheme

Plugin 'baskerville/bubblegum'

call vundle#end()

syntax enable
filetype plugin indent on " required!

" Vundle config end
"""""""""""""""""""

" Plugins configuration
"""""""""""""""""""""""

" Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['startify', 'nerdtree']

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" Plugin 'fatih/vim-go'
let g:go_version_warning = 0

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')

" Plugin 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*js,*jsx'

" Markdown
""""""""""

let g:vim_markdown_folding_disabled = 1

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

" load local plugins, if any
try
  source ~/.local.vim_plugins
catch
endtry
