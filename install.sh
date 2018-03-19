#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install jsbeautify
cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive

# install youcompleteme
cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && python install.py --tern-completer

# install autopep8 for python code style fix
pip install --upgrade autopep8

# install meteor tern
cd ~/.vim/bundle/tern_for_vim/ && npm install
cd ~/.vim && cp -f post_fix/meteor.json bundle/tern_for_vim/node_modules/tern/defs/meteor.json
echo "Please set your environment variable 'TERM' to 'screen-256color' in order to make the color scheme work"
