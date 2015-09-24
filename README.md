# home

> All my *nix home versioned, not only dotfiles

## Requirements

Requires *bash*, *curl*, *git* and *vim*. Depending on your OS, launch with root privilegies

* On Centos
: `yum install -y bash curl git vim`
* On Ubuntu
: `apt-get install -y bash curl git vim`

## Installation

All you need is a one-liner, it takes few seconds

```
curl -L https://g14n.info/home/init.sh | bash
```

### Optional

* Add **my** own home as a remote
: After adding an ssh key, following this instructions about how to add [SSH public key based authentication](http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication), I use to add *my* own *remote*. 

```
git remote rm my
git remote add my git@github.com:fibo/home.git
```

The repo remote set in the [init.sh][1] is a generic one, which can be used by anybody, but it doesn't let you to do `git push my home` to update remote with modifications. I just launch

```
git pull my home
```

## Branches

|branch  |description                                                              |
|--------|-------------------------------------------------------------------------|
|master  | contains only this README.md file                                       |
|gh-pages| contains the *init.sh* used in the one-liner installation               |
|home    | everything else, except README.md, to avoid showing it in your $HOME dir|

## How to

### Add files and folders

Everything inside `$HOME` is ignored, so to add a file or a folder, for instance *.vimrc*, you need to modify *.gitignore* once

```
echo '!.vimrc' >> .gitignore
git add .
git commit -m 'added .vimrc'
git push my home
```

### Update

Copy and paste the following commands

```
cd
git pull my home
git submodule foreach git pull origin master
cd -
# You are done!
```

  [1]: https://github.com/fibo/home/blob/gh-pages/init.sh "init.sh"
