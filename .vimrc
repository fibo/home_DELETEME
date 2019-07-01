
" Autosource config on exit
autocmd BufLeave $MYVIMRC :source $MYVIMRC

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

Plugin 'scrooloose/nerdtree'

Plugin 'myusuf3/numbers.vim'

" Usage: cs'` inside 'Hello world' transforms it to `Hello world`
Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/auto-pairs-gentle'

Plugin 'sirver/ultisnips'

Plugin 'alvan/vim-closetag'

Plugin 'kien/ctrlp.vim'

" ChucK music

Plugin 'ck.vim'

" JavaScript and related

Plugin 'kern/vim-es7'
Plugin 'othree/es.next.syntax.vim'

Plugin 'kchmck/vim-coffee-script'

Plugin 'elzr/vim-json'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx' " requires pangloss/vim-javascript

Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'

" GLSL

Plugin 'beyondmarc/glsl.vim'

" Jekyll

Plugin 'tpope/vim-liquid'

" Golang
"
" install golang, for instance, launch
"     .software_install Golang
" then install tools (gocode, goimport, godef, oracle, golint, etc.)
"     vim +GoInstallBinaries

Plugin 'fatih/vim-go'

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

set hidden
set backspace=indent,eol,start

" Handle paste
""""""""""""""

" Code from
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

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

" Font
""""""

" To open a font chooser with the fonts available on your system, launch
"
"     :set guifont=*

set guifont=Monospace\ 14

" Enable list
"""""""""""""

set number
set list

" Define characters to show when you show formatting
set listchars=tab:\|\ ,trail:☠,extends:>,precedes:<,nbsp:+

" it is ok to wrap lines, just use gj or gk to move
set wrap

" Completion
""""""""""""

" Dictionary Word Completion Using Ctrl-x Ctrl-k
set dictionary+=/usr/share/dict/words

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enhanced cursor
"""""""""""""""""

set cursorcolumn
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80
endif

" History
"""""""""

set history=1000    " remember more commands and search history
set undolevels=1000 " use many much levels of undo
set undofile " persistent undo, even if you close and reopen Vim

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

" Toggle NERDTree with CTRL-n
map <C-n> :NERDTreeToggle<CR>

" Plugin 'alvan/vim-closetag'

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*js,*jsx'

" Plugin 'kien/ctrlp.vim'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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

" disable beeping and flashing
" see http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Better colors when using vim from an ssh terminal
set t_Co=256

" Better comment handling when using J
" See https://kinbiko.com/vim/my-shiniest-vim-gems/
set formatoptions+=j

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

" Credits: @nobleach in this HN thread
" https://news.ycombinator.com/item?id=19742599
inoremap jk <esc>
" ... and why not this?
inoremap uu <esc>

" ChucK
"""""""

autocmd BufNewFile,BufRead *.ck set filetype=ck

" CoffeeScript
""""""""""""""

autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd BufRead,BufNewFile *.coffee.md set filetype=coffee

" CSS
""""""

autocmd Filetype css setlocal iskeyword+=-
autocmd Filetype scss setlocal iskeyword+=-

" HTML
""""""

autocmd Filetype html setlocal iskeyword+=-

" Markdown
""""""""""

let g:vim_markdown_folding_disabled = 1

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

