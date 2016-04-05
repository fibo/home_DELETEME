" vim-plug
""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go'

" Needs Python3 support, after install run :UpdateRemotePlugins
"Plug 'Shougo/deoplete.nvim'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'scrooloose/syntastic'

"Plug 'benekastah/neomake'

" Color schemes
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/base16-vim'
Plug 'baskerville/bubblegum'
Plug 'flazz/vim-colorschemes'
Plug 'sickill/vim-monokai'
Plug 'trapd00r/neverland-vim-theme'

" Add plugins to &runtimepath
call plug#end()
