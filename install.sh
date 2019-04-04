#!/bin/bash

install .gitattributes ~/
install .gitconfig ~/
install .gitignore ~/
install .tmux.conf ~/
install .vim ~/
install .vimrc ~/
install .vimrc.local ~/
install .vimrc.mine ~/
cp -pR .zsh ~/
install .zshrc ~/
install .zshrc.local ~/
install -d ~/bin
install diff-highlight ~/bin/

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c BundleInstall -c qa!
