#!/bin/sh
set -ex
sudo pacman -Sy ctags powerline vim git fish tmux

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
vim +PluginInstall

# fish
if [ ! -d "~/.config/fish" ]; then
    mkdir -p ~/.config/fish
fi

cp config.fish ~/.config/fish/

# tmux
cp .tmux.conf ~

# bash
cp .bashrc ~

# powerline colorscheme
cp -rf powerline ~/.config

