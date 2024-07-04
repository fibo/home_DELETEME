# home

> All my *nix home versioned, not only dotfiles

## Table of Contents

  * [Installation](#installation)
  * [Branches](#branches)
  * [How to](#how-to)
    - [Add files and folders](#add-files-and-folders)
    - [Add submodule](#add-submodule)
    - [Update](#update)
  * [License](#license)

## Installation

All you need is a one-liner, it takes few seconds

```bash
curl -L https://fibo.github.io/home/init.sh | bash
```

## Branches

|branch  |description                                                |
|--------|-----------------------------------------------------------|
|main    | contains only this README.md file                         |
|gh-pages| contains the *init.sh* used in the one-liner installation |
|home    | everything else: dotfiles, local bins, etc.               |

## How to

### Add files and folders

To add a file you need to modify *.gitignore* first. For example

```sh
echo '!.zshrc' >> .gitignore
git add .
git commit -m 'added .zshrc'
git push origin home
```

### Add submodule

Add a new submodule, moving into your home and providing a relative path.

```sh
cd
git submodule add -f https://github.com/foo/bar.git home/relative/path/to/foo/bar
```

### Update all submodules

Copy and paste the following commands

```sh
cd
git pull origin home
git submodule foreach git pull origin master
git commit -am ':arrow_up: updated submodules'
git push origin home
```

### Update to latest version

Copy and paste the following commands

```sh
cd
git pull origin home
git submodule foreach git pull origin master
```

## License

[MIT](https://fibo.github.io/mit-license/)
