# home

> not only dotfiles

## Installation

All you need is a one-liner, it takes few seconds

    curl -L https://g14n.info/home/init.sh | bash

or run the following equivalent commands manually

    cd
    git init
    git checkout -b home
    git remote add my https://github.com/fibo/home.git
    git pull my home
    git submodule update --init
    vim +PluginInstall +qall
    cd -
    # You are done!

## Branches

|branch  |description                                                              |
|--------|-------------------------------------------------------------------------|
|master  |contains only this README.md file                                        |
|gh-pages| contains the init.sh used in the one-liner installation                 |
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
    cd -
    # You are done!

