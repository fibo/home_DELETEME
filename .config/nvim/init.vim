
" vim-plug
""""""""""
" Install with
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go'

"Plug 'benekastah/neomake'

Plug 'jnurmine/Zenburn'

" Add plugins to &runtimepath
call plug#end()

colorscheme zenburn

let g:go_fmt_command = "goimports"

