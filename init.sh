#!bin/bash
cd
# Backup files and folders.
function backup_if_any () { [ -e $1 ] && mv -v $1 $1.orig; }

backup_if_any .bash
backup_if_any .bash_logout
backup_if_any .bashrc
backup_if_any .ctags
backup_if_any .gitignore
backup_if_any .gitmodules
backup_if_any .vimrc
backup_if_any .aliases
backup_if_any .screenrc
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
vim +VimProcInstall

# Basic git configuration prompt
## git user.name
GIT_USER=$(git config --global user.name)
if [ -z "$GIT_USER" ]
then
    read -t 60 -p "[git config] Enter your user.name: " GIT_USER
    git config --global user.name $GIT_USER
fi
## git user.email
GIT_EMAIL=$(git config --global user.email)
if [ -z "$GIT_EMAIL" ]
then
    read -t 60 -p "[git config] Enter your user.email: " GIT_EMAIL
    git config --global user.email $GIT_EMAIL
fi
# Load changes into current session
source ~/.bash_profile
# Back to previous folder.
cd -
