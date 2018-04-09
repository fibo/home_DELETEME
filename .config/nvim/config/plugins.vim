""""""""""""
" vim-plug "
""""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'SirVer/ultisnips'

" Defines my private snippet directory which is versioned.
" let g:UltiSnipsSnippetsDir="~/.nvim/myUltiSnips"
" let g:UltiSnipsSnippetDirectories = ['myUltiSnips']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-tab>"
" let g:UltiSnipsExpandTrigger="<C-space>"

Plug 'myusuf3/numbers.vim'

let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']


Plug 'editorconfig/editorconfig-vim'

Plug 'jiangmiao/auto-pairs'

" Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Golang

Plug 'fatih/vim-go'

let g:go_fmt_command = "goimports"

" JSON

Plug 'elzr/vim-json'

" Pug

Plug 'digitaltoad/vim-pug'

" HTML

Plug 'mattn/emmet-vim'
" Example: type html:5 then CTRL-y-, then try other expression like div>p

" Markdown

" The tabular plugin must come before vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1

" Supercollider

Plug 'supercollider/scvim'

" Color schemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/Zenburn'

Plug 'JarrodCTaylor/spartan'

" Plug 'baskerville/bubblegum'
" Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'sickill/vim-monokai'
" Plug 'trapd00r/neverland-vim-theme'
" Plug 'lifepillar/vim-solarized8'

" Add plugins to &runtimepath
call plug#end()

