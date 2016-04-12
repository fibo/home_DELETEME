" vim-plug
""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'ntpeters/vim-better-whitespace'

Plug 'kien/ctrlp.vim'

" Needs Python3 support, after install run :UpdateRemotePlugins
Plug 'Shougo/deoplete.nvim'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"
Plug 'SirVer/ultisnips'

Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic'

"Plug 'benekastah/neomake'

Plug 'editorconfig/editorconfig-vim'

Plug 'jiangmiao/auto-pairs'

" Languages
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
"Plug 'gabrielelana/vim-markdown'

"Plug 'ervandew/supertab'

" Color schemes
Plug 'jnurmine/Zenburn'
Plug 'baskerville/bubblegum'
"Plug 'chriskempson/base16-vim'
"Plug 'flazz/vim-colorschemes'
Plug 'sickill/vim-monokai'
Plug 'trapd00r/neverland-vim-theme'
Plug 'nanotech/jellybeans.vim'

" Add plugins to &runtimepath
call plug#end()
