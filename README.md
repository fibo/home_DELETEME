# home

> not only dotfiles

## Requirements

Requires *bash*, *curl*, *git* and *vim*. On Centos 7 launch

```
# yum install -y bash curl git vim
```

## Installation

All you need is a one-liner, it takes few seconds

    curl -L http://g14n.info/home/init.sh | bash

After installation is completed, optionally remove backup files.

```
rm -rf .*.orig
```

## Branches

|branch  |description                                                              |
|--------|-------------------------------------------------------------------------|
|master  |contains only this README.md file                                        |
|gh-pages| contains the *init.sh* used in the one-liner installation               |
|home    | everything else, except README.md, to avoid showing it in your $HOME dir|

## How to

### Add files and folders

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

