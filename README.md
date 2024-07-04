# home

> All my *nix home versioned, not only dotfiles

## Table of Contents

  * [Installation](#installation)
  * [Update](#update)
  * [Branches](#branches)
  * [How to](#how-to)
    - [Add files and folders](#add-files-and-folders)
    - [Add submodule](#add-submodule)
  * [License](#license)

## Installation

All you need is a one-liner, it takes few seconds

```bash
curl -L https://fibo.github.io/home/init.sh | bash
```

## Update

To update to latest version: go to `$HOME`, pull updates and submodules

```sh
cd
git pull my home
git submodule foreach git pull
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
cd path/to/repo/fibo/home
echo '!.zshrc' >> .gitignore
git add .zshrc
git commit -m 'added .zshrc'
git push
```

### Add submodule

Add a new submodule, moving into your home and providing a relative path.

```sh
cd
git submodule add -f https://github.com/foo/bar.git home/relative/path/to/foo/bar
```

### Update all submodules

Do something like

```sh
cd path/to/repo/fibo/home
git pull
git submodule foreach git pull
git commit -am ':arrow_up: updated submodules'
git push
```

## License

[MIT](https://fibo.github.io/mit-license/)
