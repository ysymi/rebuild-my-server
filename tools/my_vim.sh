#!/usr/bin/env bash

mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install cmake
cp dotfiles/.vimrc ~/.vimrc
vim +PluginInstall +qall
