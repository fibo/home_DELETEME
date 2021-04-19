
" Autosource config on exit
autocmd BufLeave $MYVIMRC :source $MYVIMRC


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
" set undofile " persistent undo, even if you close and reopen Vim

" Mappings
""""""""""

" Insert current date in yyyy-mm-dd format with \d while in insert mode,
" useful for comments and Changelogs.
" Credits to Tom Wyant
" http://blogs.perl.org/users/neilb/2013/09/a-convention-for-changes-files.html#comment-1154925
:inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" Avoid using CTRL-W in some contexts, e.g. a terminal inside a browser
" Using SHIFT-h j k l to move to a splitted windows is awesome!
nmap <S-h> <C-w>h
nmap <S-j> <C-w>j
nmap <S-k> <C-w>k
nmap <S-l> <C-w>l

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

set wildmenu        " enhanced command-line completion
set laststatus=2    " always show status line

" Use F12 to toggle auto-indenting for text paste
set pastetoggle=<F12>

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

" Credits: @nobleach in this HN thread
" https://news.ycombinator.com/item?id=19742599
inoremap jk <esc>
" ... and why not this?
inoremap uu <esc>
inoremap kj <esc>

" CSS
""""""

autocmd Filetype css setlocal iskeyword+=-
autocmd Filetype scss setlocal iskeyword+=-

" HTML
""""""

autocmd Filetype html setlocal iskeyword+=-

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

" load plugins
try
  source ~/.vim_plugins
catch
endtry

" load local vimrc, if any
try
  source ~/.local.vimrc
catch
endtry

