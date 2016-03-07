# init home

[![KLP](https://img.shields.io/badge/kiss-literate-orange.svg)](http://g14n.info/kiss-literate-programming)

This is the script used to [init home](https://github.com/fibo/home/blob/master/README.md#installation).

    #!/bin/bash
    #
    # For more information see https://github.com/fibo/home/blob/master/README.md#installation
    
Start from `$HOME` dir

    cd

First of all, remove *.git* folder, if any

    [ -d .git ] && rm -rf .git

## Backup files and folders.

Create backup folder

    BACKUP_DAY=$(date +%F)
    BACKUP_DIR=$HOME/.home_backup.$BACKUP_DAY
    mkdir -p $BACKUP_DIR
    
Define a backup util function

    function backup_if_any () {
        TARGET=$(echo $1 | tr / _)
        [ -e $1 ] && mv -v $1 $BACKUP_DIR/$TARGET.$BACKUP_DAY;
    }

Backup *.gitignore*, and any file it excludes (i.e. predixed with a `!`)

    backup_if_any .gitignore
    curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
        | grep ! | cut -d ! -f2 \
            | while read x; do backup_if_any $x; done

Backup *.gitmodules*, and modules listed in it

    backup_if_any .gitmodules
    curl -L https://raw.githubusercontent.com/fibo/home/home/.gitmodules \
        | grep path | cut -d = -f2 \
            | while read x; do backup_if_any $x; done

## Init home

Here we go, create repo and init submodules

    git init
    git checkout -b home
    git remote add my https://github.com/fibo/home.git
    git pull my home
    git submodule update --init

Install vim plugins, I ❤ this part

    vim +PluginInstall +qall

## Basic git configuration prompt

### git user.name

    GIT_USER=$(git config --global user.name)
    if [ -z "$GIT_USER" ]
    then
        read -t 60 -p "[git config] Enter your user.name: " GIT_USER
        git config --global user.name $GIT_USER
    fi

### git user.email

    GIT_EMAIL=$(git config --global user.email)
    if [ -z "$GIT_EMAIL" ]
    then
        read -t 60 -p "[git config] Enter your user.email: " GIT_EMAIL
        git config --global user.email $GIT_EMAIL
    fi

## Finally

Load changes into current session.

    source ~/.bashrc

Back to previous folder.

    cd -

    echo home sweet home
