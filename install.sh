#!/bin/bash

# init and update submodule
git submodule init
git submodule update

# install jsbeautify
cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive

# install youcompleteme
cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && python install.py --clang-completer --tern-completer

# install meteor tern
cd ~/.vim && cp -f post_fix/meteor.json bundle/tern_for_vim/node_modules/tern/defs/meteor.json
