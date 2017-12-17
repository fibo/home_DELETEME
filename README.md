# home

> All my *nix home versioned, not only dotfiles

<img src="https://rawgit.com/fibo/os-icons8/master/Apple-50.png" width="50" height="50" /> <img src="https://rawgit.com/fibo/os-icons8/master/Linux-50.png" width="50" height="50" />

## Table of Contents

  * [Requirements](#requirements)
  * [Installation](#installation)
  * [Branches](#branches)
  * [How to](#how-to)
    - [Add files and folders](#add-files-and-folders)
    - [Add submodule](#add-submodule)
    - [Update](#update)
  * [License](#license)

## Requirements

Requires *bash*, *curl*, *git* and *vim*. Depending on your OS, launch with root privilegies

* On Centos
: `yum install -y bash curl git vim`
* On Ubuntu
: `apt-get install -y bash curl git vim`
* On OS X
: Install [brew](https://brew.sh/), launch commands `brew install bash` and `brew install findutils --with-default-names` then go to *Terminal* > *Preferences* > *General* > *Shell opens with* and set *Command* to `/usr/local/bin/bash`.

## Installation

All you need is a one-liner, it takes few seconds

```bash
curl -L https://g14n.info/home/init.sh | bash
```

### Troubleshooting

If you are behind a firewall, try setting `HTTPS_PROXY` variable. If https scheme does not work, do not try with http scheme cause is not supported by *home*.

### Optional

* Add **my** own home as a remote
: After adding an ssh key, following this instructions about how to add [SSH public key based authentication](http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication), I use to add *my* own *remote*. 

```bash
git remote rm my
git remote add my git@github.com:fibo/home.git
```

The repo remote set in the [init.sh][init_script] is a generic one, which can be used by anybody, but it doesn't let you to do `git push my home` to update remote with modifications.

## Branches

|branch  |description                                                              |
|--------|-------------------------------------------------------------------------|
|master  | contains only this README.md file                                       |
|gh-pages| contains the *init.sh* used in the one-liner installation               |
|home    | everything else, except README.md, to avoid showing it in your $HOME dir|

## How to

### Add files and folders

Everything inside `$HOME` is ignored, so to add a file or a folder, for instance *.vimrc*, you need to modify *.gitignore* once

```bash
echo '!.vimrc' >> .gitignore
git add .
git commit -m 'added .vimrc'
git push my home
```

### Add submodule

Add a new submodule, moving into your home and providing a relative path.

```bash
cd
git submodule add -f https://github.com/foo/bar.git home/relative/path/to/foo/bar
```

### Update all submodules

Copy and paste the following commands

```bash
cd
git pull my home
git submodule foreach git pull origin master
git commit -am ':arrow_up: updated submodules'
git push my home
# You are done!
```

### Update to latest version

Copy and paste the following commands

```bash
cd
git pull my home
git submodule foreach git pull origin master
# You are done!
```

## License

[MIT](http://g14n.info/mit-license/)

<sub>OS icons provided by <a href="https://icons8.com/">icons8</a>.</sub>

[init_script]: https://github.com/fibo/home/blob/gh-pages/init.sh "init.sh"
