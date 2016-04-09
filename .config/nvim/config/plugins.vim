
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

let g:syntastic_enable_balloons = 1

let g:syntastic_enable_highlighting = 1
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

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
" Assume feross/standard should be installed locally.
elseif filereadable('node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
elseif filereadable('../node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
elseif filereadable('../../node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
" Fallback to eslint, using ~/.eslintrc.json which extends eslint:recommended
else
  let b:syntastic_checkers = ['eslint']
endif
