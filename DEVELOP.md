# Development notes

## Branches

|branch  |description                                                |
|--------|-----------------------------------------------------------|
|main    | contains only documentation                               |
|gh-pages| contains the *init.sh* used in the one-liner installation |
|home    | everything else: dotfiles, local bins, etc.               |

## How to

### Add files and folders

To add a file you need to modify *.gitignore* first. For example

```sh
cd path/to/repo/fibo/home
git switch home
echo '!.bashrc' >> .gitignore
git add .bashrc
git commit -m 'added .bashrc'
git push origin home
```

### Add submodule

To add a new submodule, launch something like

```sh
git submodule add -f https://github.com/foo/bar.git ./relative/path/to/foo/bar
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
