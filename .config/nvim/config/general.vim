set number
set list
set listchars=tab:\|\ ,trail:☠,extends:»,precedes:«,nbsp:+

set cursorcolumn
set cursorline

if filereadable('colorscheme.vim')
  source colorscheme.vim
else
  colorscheme desert
endif
