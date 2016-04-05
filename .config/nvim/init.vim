"How to
"""""""

" Enable Python3 support:
"     sudo apt-get install python3-setuptools
"     sudo easy_install3 pip
"     sudo pip3 install neovim
"
" See also https://neovim.io/doc/user/nvim_python.html

" Install vim-plug with
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Following suggestion from article
" https://gregjs.com/vim/2016/do-yourself-a-favor-and-modularize-your-vimrc-init-vim/
source $HOME/.config/nvim/config/init.vim
source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/plugins.vim
