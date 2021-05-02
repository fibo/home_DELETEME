" set hidden " abandon a buffer when unloaded

" set backspace=indent,eol,start

" Handle paste
""""""""""""""

" Code from
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

" let &t_SI .= "\<Esc>[?2004h"
" let &t_EI .= "\<Esc>[?2004l"

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction

" Completion
""""""""""""

" Dictionary Word Completion Using Ctrl-x Ctrl-k
" set dictionary+=/usr/share/dict/words

" Tabs
""""""

" set smarttab   " insert tabs on the start of a line according to
               "   shiftwidth, not tabstop
" Set tab width to 4, I think it improves readability.
" set tabstop=4


" Better comment handling when using J
" See https://kinbiko.com/vim/my-shiniest-vim-gems/
" set formatoptions+=j

" set wildmenu        " enhanced command-line completion
" set laststatus=2    " always show status line

" Use F12 to toggle auto-indenting for text paste
" set autoindent    " always set autoindenting on
" set copyindent    " copy the previous indentation on autoindenting
" set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
" set showmatch     " set show matching parenthesis

" CSS
"""""

" autocmd Filetype css setlocal iskeyword+=-
" autocmd Filetype scss setlocal iskeyword+=-

" HTML
""""""

" autocmd Filetype html setlocal iskeyword+=-

" Perl
""""""

" autocmd Filetype perl map <F2> :%!perltidy<CR>                    " indent whole file
" autocmd Filetype perl map <F3> :!prove -l<CR>                     " run tests
" autocmd Filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
" autocmd Filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
" autocmd Filetype perl setlocal autoindent
" autocmd Filetype perl setlocal shiftwidth=4
" autocmd Filetype perl setlocal softtabstop=4
" autocmd Filetype perl setlocal expandtab

" use perltidy for .pl, .pm, and .t
" autocmd BufRead,BufNewFile *.pl setlocal equalprg=perltidy
" autocmd BufRead,BufNewFile *.PL setlocal equalprg=perltidy
" autocmd BufRead,BufNewFile *.pm setlocal equalprg=perltidy
" autocmd BufRead,BufNewFile *.t  setlocal equalprg=perltidy

" vim / neovim common configuration
try
  source ~/.vim_essentials
catch
endtry

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

