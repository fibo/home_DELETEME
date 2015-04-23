# home

> not only dotfiles

## Requirements

Requires *bash*, *curl*, *git* and *vim*. On Centos 7 launch

```
# yum install -y bash curl git vim
```

## Installation

All you need is a one-liner, it takes few seconds

    curl -L https://g14n.info/home/init.sh | bash

or run the following equivalent commands manually

```
cd
# Backup files and folders. 
function backup_if_any () { [ -e $1 ] && mv -v $1 $1.b4; }
backup_if_any .bash
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
git remote add my git@github.com:fibo/home.git
git pull my home
git submodule update --init
vim +PluginInstall +qall
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
# You are done!
```

After installation is completed, optionally remove backup files.

```
rm -rf .*.orig
```

## Branches

|branch  |description                                                              |
|--------|-------------------------------------------------------------------------|
|master  |contains only this README.md file                                        |
|gh-pages| contains the *init.sh* used in the one-liner installation                 |
|home    | everything else, except README.md, to avoid showing it in your $HOME dir|

## How to

### Add stuff

Everything inside `$HOME` is ignored, so to add a file or a folder, for instance *.vimrc*, you need to modify *.gitignore* once

    echo '!.vimrc' >> .gitignore
    git add .
    git commit -m 'added .vimrc'
    git push my home

### Update

    cd
    git pull my home
    git submodule foreach git pull origin master
    cd -
    # You are done!

