#!/bin/bash
#
# For more information see https://github.com/fibo/home/blob/master/README.md#installation

cd
[ -d .git ] && rm -rf .git
BACKUP_DAY=$(date +%F)
BACKUP_DIR=$HOME/.home_backup.$BACKUP_DAY
mkdir -p $BACKUP_DIR

function backup_if_any () {
    TARGET=$(echo $1 | tr / _)
    [ -e $1 ] && mv -v $1 $BACKUP_DIR/$TARGET.$BACKUP_DAY;
}
backup_if_any .gitignore
curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
    | grep ! | cut -d ! -f2 \
        | while read x; do backup_if_any $x; done
backup_if_any .gitmodules
curl -L https://raw.githubusercontent.com/fibo/home/home/.gitmodules \
    | grep path | cut -d = -f2 \
        | while read x; do backup_if_any $x; done
git init
git checkout -b home
git remote add my https://github.com/fibo/home.git
git pull my home
git submodule init
git submodule update --recursive --remote
git submodule foreach git config core.fileMode false
vim +PluginInstall +qall
GIT_USER=$(git config --global user.name)
if [ -z "$GIT_USER" ]
then
    read -t 60 -p "[git config] Enter your user.name: " GIT_USER
    git config --global user.name $GIT_USER
fi
GIT_EMAIL=$(git config --global user.email)
if [ -z "$GIT_EMAIL" ]
then
    read -t 60 -p "[git config] Enter your user.email: " GIT_EMAIL
    git config --global user.email $GIT_EMAIL
fi
source ~/.bashrc
cd -
echo home sweet home
