#!bin/bash
cd
# Backup files and folders.
BACKUP_DAY=$(date +%F)
BACKUP_DIR=$HOME/.home_backup.$BACKUP_DAY
function backup_if_any () { [ -e $1 ] && mv -v $1 $BACKUP_DIR/$1.$BACKUP_DAY; }

backup_if_any .gitignore
backup_if_any .gitmodules

grep ! .gitignore | cut -d ! -f2- | while read x do;
    backup_if_any $x
done

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
