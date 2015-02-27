#!bin/bash
cd
git init
git checkout -b home
git remote add my https://github.com/fibo/home.git
git pull my home
git submodule update --init
vim +PluginInstall +qall
cd -

