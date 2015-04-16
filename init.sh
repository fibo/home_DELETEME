#!bin/bash
cd
# Backup files and folders.
function backup_if_any () { [ -e $1 ] && mv -v $1 $1.orig; }
backup_if_any .bash_logout
backup_if_any .bashrc
backup_if_any .gitignore
backup_if_any .gitmodules
backup_if_any .vimrc
backup_if_any .aliases
backup_if_any .software
backup_if_any .vim
backup_if_any .git
# Init repo.
git init
git checkout -b home
git remote add my https://github.com/fibo/home.git
git pull my home
git submodule update --init
vim +PluginInstall +qall
# Load changes into current session
source ~/.bash_profile
# Back to previous folder.
cd -
