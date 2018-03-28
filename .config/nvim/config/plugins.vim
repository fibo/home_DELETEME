""""""""""""
" vim-plug "
""""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'myusuf3/numbers.vim'

let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']

Plug 'kien/ctrlp.vim'

" Credits: https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"
Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic'

" https://github.com/scrooloose/syntastic#3-recommended-settings

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"let g:syntastic_enable_balloons = 1

"let g:syntastic_enable_highlighting = 1
"highlight link SyntasticError SpellBad
"highlight link SyntasticWarning SpellCap

"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_aggregate_errors = 1

function LoadSyntasticJavaScriptStandard()
  let b:syntastic_checkers = ['standard']
  let g:syntastic_javascript_standard_args = "--global $ --global it --global describe"
endfunction

" Check for jshint config first ...
if filereadable('.jshintrc')
  let b:syntastic_checkers = ['jshint']
" ... then for eslint.
elseif filereadable('.eslintrc')
  let b:syntastic_checkers = ['eslint']
elseif filereadable('.eslintrc.json')
  let b:syntastic_checkers = ['eslint']
else
  call LoadSyntasticJavaScriptStandard()
endif

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ 'perl' ]
let g:syntastic_perl_lib_path = [ './lib' ]

"Plug 'benekastah/neomake'

Plug 'editorconfig/editorconfig-vim'

Plug 'jiangmiao/auto-pairs'

" Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'fatih/vim-go'

let g:go_fmt_command = "goimports"

Plug 'elzr/vim-json'

"Plug 'gabrielelana/vim-markdown'

Plug 'digitaltoad/vim-pug'

" The tabular plugin must come before vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1

" Color schemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'jnurmine/Zenburn'
Plug 'baskerville/bubblegum'
"Plug 'chriskempson/base16-vim'
"Plug 'flazz/vim-colorschemes'
Plug 'sickill/vim-monokai'
Plug 'trapd00r/neverland-vim-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'lifepillar/vim-solarized8'

" Add plugins to &runtimepath
call plug#end()

