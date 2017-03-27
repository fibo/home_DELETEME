" Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1

" Plug 'Shougo/deoplete.nvim'

let g:deoplete#enable_at_startup = 1

" Plug 'kien/ctrlp.vim'

" Credits: https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"let g:ctrlp_custom_ignore = {
""  \ 'dir':  '\v[\/](node_modules|\.(git|hg|svn))$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ }
"  \ 'link': 'some_bad_symbolic_links',

" Plug 'vim-airline/vim-airline'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

" Plug 'scrooloose/syntastic'

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
