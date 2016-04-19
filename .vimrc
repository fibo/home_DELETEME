
" Autosource config on exit
autocmd BufLeave $MYVIMRC :source $MYVIMRC

" Start Vundle config
"""""""""""""""""""""

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

" my plugin list here

Plugin 'godlygeek/tabular'

Plugin 'simnalamburt/vim-mundo'

Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'mileszs/ack.vim'

" Needs ctags.
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Autotag'

Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'myusuf3/numbers.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/syntastic'
Plugin 'myint/syntastic-extras'

""" Should be deprecated in favor of neovim.
" Run :VimProcInstall once before running :VimShell
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'junegunn/vim-emoji'

Plugin 'ervandew/supertab'

" Languages
"""""""""""

" JavaScript and related
Plugin 'AndrewRadev/vim-eco'
" Plugin 'walm/jshint.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nikvdp/ejs-syntax'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elzr/vim-json'
Plugin 'digitaltoad/vim-jade'

" HTML
Plugin 'edsono/vim-matchit'

" Golang
" install golang, for instance, launch
"     .software_install Golang
" then install tools (gocode, goimport, godef, oracle, golint, etc.)
"     vim +GoInstallBinaries
Plugin 'fatih/vim-go'

" Misc
Plugin 'gabrielelana/vim-markdown'

" Typescript
" Plugin 'Quramy/tsuquyomi'
" Plugin 'leafgarland/typescript-vim'

" Color schemes
"""""""""""""""

Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum'
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
Plugin 'trapd00r/neverland-vim-theme'

" Color scheme goodies. F8 switches the colorscheme.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
" try Plugin 'Taverius/vim-colorscheme-manager'

call vundle#end()

syntax enable
filetype plugin indent on " required!

" end Vundle config
"""""""""""""""""""

" Set gvim window size
""""""""""""""""""""""

" See http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=40 columns=177
endif

" Use UTF-8 encoding
""""""""""""""""""""

set encoding=utf8
set termencoding=utf-8
set fileencodings=        " no encoding conversion
" this was ok on Windows: set guifontwide=MingLiU:h10
set guifont=Consolas:h11:cANSI

" Enable list
"""""""""""""

set number
set list

" Define characters to show when you show formatting
set listchars=tab:\|\ ,trail:☠,extends:>,precedes:<,nbsp:+

" it is ok to wrap lines, just use gj or gk to move
set wrap

" More natural split opening
""""""""""""""""""""""""""""

set splitbelow
set splitright

" Better search
"""""""""""""""

set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set smartcase  " ignore case if search pattern is all lowercase,
               "   case-sensitive otherwise
set ignorecase " ignore case when searching

" Enhanced cursor
"""""""""""""""""

set cursorcolumn
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Easier split navigations
""""""""""""""""""""""""""

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" History
"""""""""

set history=1000    " remember more commands and search history
set undolevels=1000 " use many much levels of undo

" Plugins configuration
"""""""""""""""""""""""

" Plugin 'junegunn/vim-emoji'

autocmd VimEnter * if @% == 'COMMIT_EDITMSG' | set completefunc=emoji#complete | endif

" Plugin 'airblade/vim-gitgutter'

silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" Plugin 'majutsushi/tagbar'
let g:tagbar_autoclose = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autopreview = 1

" Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" To enable JavaScript linters, install them (also feross/standard)
" in order to be available to syntastic.
"
"     npm install jshint eslint standard -g
"
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
  let b:syntastic_checkers = ['standard']
  let g:syntastic_javascript_standard_args = "--global $ --global it --global describe"
" Fallback to eslint, using ~/.eslintrc.json which extends eslint:recommended
else
  let b:syntastic_checkers = ['eslint']
endif

" Block ZZ if there are syntax errors.
"nnoremap ZZ :call syntastic_extras#quit_hook()<cr>

" Mappings
""""""""""

" Insert current date in yyyy-mm-dd format with \d while in insert mode,
" useful for comments and Changelogs.
" Credits to Tom Wyant
" http://blogs.perl.org/users/neilb/2013/09/a-convention-for-changes-files.html#comment-1154925
:inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" Tabs
""""""

set smarttab   " insert tabs on the start of a line according to
               "   shiftwidth, not tabstop
" Set tab width to 4, I think it improves readability.
set tabstop=4

" Miscellanea
"""""""""""""

" Load local configuration, i.e. project-specific configurations.
if filereadable('.local.vimrc')
  so .local.vimrc
endif

" disable beeping and flashing
" see http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Better colors when using vim from an ssh terminal
set t_Co=256
" My favourite colorscheme
try
  colorscheme bubblegum-256-dark
catch
  colorscheme desert
endtry

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line

" Use F12 to toggle auto-indenting for text paste
set pastetoggle=<F12>

set mouse=a

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

" HTML
""""""

autocmd Filetype html setlocal autoindent
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype html setlocal softtabstop=2
autocmd Filetype html setlocal expandtab

" Handlebars
""""""""""""

autocmd Filetype html.handlebars setlocal autoindent
autocmd Filetype html.handlebars setlocal shiftwidth=2
autocmd Filetype html.handlebars setlocal softtabstop=2
autocmd Filetype html.handlebars setlocal expandtab

" JavaScript
""""""""""""

autocmd Filetype javascript setlocal autoindent
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype javascript setlocal softtabstop=2
autocmd Filetype javascript setlocal expandtab

" CoffeeScript
""""""""""""""

autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd BufRead,BufNewFile *.coffee.md set filetype=coffee

" Perl
""""""

autocmd Filetype perl map <F2> :%!perltidy<CR>                    " indent whole file
autocmd Filetype perl map <F3> :!prove -l<CR>                     " run tests
autocmd Filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
autocmd Filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
autocmd Filetype perl setlocal autoindent
autocmd Filetype perl setlocal shiftwidth=4
autocmd Filetype perl setlocal softtabstop=4
autocmd Filetype perl setlocal expandtab

" use perltidy for .pl, .pm, and .t
autocmd BufRead,BufNewFile *.pl setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.PL setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.pm setlocal equalprg=perltidy
autocmd BufRead,BufNewFile *.t  setlocal equalprg=perltidy

" Tagbar settings to recognise Perl Moo..Moose
" taken from https://gist.github.com/jbolila/7598018
let g:tagbar_type_perl = {
    \ 'ctagstype'   : 'Perl',
    \ 'kinds' : [
        \ 'p:packages:1:0',
        \ 'u:uses:1:0',
        \ 'r:requires:1:0',
        \ 'e:extends',
        \ 'w:roles',
        \ 'o:ours:1:0',
        \ 'c:constants:1:0',
        \ 'f:formats:1:0',
        \ 'a:attributes',
        \ 's:subroutines',
        \ 'x:around:1:0',
        \ 'l:aliases',
        \ 'd:pod:1:0',
    \ ],
\ }

" Syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ 'perl' ]
let g:syntastic_perl_lib_path = [ './lib' ]

" au BufRead,BufNewFile *.t let  g:syntastic_perl_perlcritic_args="--severity 4 --theme 'test'"
" au BufRead,BufNewFile *.pl let g:syntastic_perl_perlcritic_args="--severity 4 --theme 'script'"
" au BufRead,BufNewFile *.pm let g:syntastic_perl_perlcritic_args="--severity 4 --theme 'module'"

" Golang
"""""""""

" Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
