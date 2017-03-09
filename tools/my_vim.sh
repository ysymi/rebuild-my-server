#!/usr/bin/env bash


cp dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew install cmake
cd ~/.vim/bundle/YouCompleteMe
./install.py
