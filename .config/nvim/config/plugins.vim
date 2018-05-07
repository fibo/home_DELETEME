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

Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tacahiroy/ctrlp-funky'

let g:ctrlp_funky_syntax_highlight = 1

nnoremap <Leader>f :CtrlPFunky<Cr>

Plug 'SirVer/ultisnips'
" Install https://github.com/fibo/UltiSnips

Plug 'myusuf3/numbers.vim'

let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']

Plug 'editorconfig/editorconfig-vim'

Plug 'jiangmiao/auto-pairs'

if has("mac")
  let g:AutoPairsShortcutFastWrap   = 'Ω' " <M-w>
else
  let g:AutoPairsShortcutFastWrap   = '<M-w>'
endif

" Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GLSL

Plug 'beyondmarc/glsl.vim'

" Golang

Plug 'fatih/vim-go'

let g:go_fmt_command = "goimports"

" Jekyll

Plug 'tpope/vim-liquid'

" JSON

Plug 'elzr/vim-json'

" Pug

Plug 'digitaltoad/vim-pug'

" HTML

Plug 'mattn/emmet-vim'
" Example: type html:5 then CTRL-y-, then try other expression like div>p

" https://github.com/mattn/emmet-vim/issues/232#issuecomment-276705146
let g:user_emmet_install_global = 0
autocmd FileType html,css  EmmetInstall
" autocmd FileType html,css imap <TAB> <plug>(emmet-expand-abbr)
autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Markdown

" The tabular plugin must come before vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1

" Supercollider

Plug 'supercollider/scvim'

" WebAssembly

Plug 'rhysd/vim-wasm'

" Color schemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/Zenburn'
Plug 'JarrodCTaylor/spartan'

" Add plugins to &runtimepath
call plug#end()

