#!/bin/bash


# create a link for vimrc
if  [[ !( -L ~/.vimrc ) ]]; then
    echo "~/.vimrc is not a link, it will be replaced to a link to ~/.vim/.vimrc"
    vimrc_old=".vimrc_`date +%Y%m%d_%H%M`"
    mv ~/.vimrc ~/$vimrc_old
    echo "the old .vimrc have been backup as ~/$vimrc_old"
    ln -s ~/.vim/.vimrc ~/.vimrc
fi

# make sure git command exists
if ! which git >/dev/null; then
    echo "git command not exists, please install git first!"
fi

# make sure that python3 or python is installed
which python3 >/dev/null \
    || which python >/dev/null || ( echo "python and python3 is not installed yet!" && exit 1 )

# make sure that we have installed cmake
which cmake >/dev/null \
    || ( echo "cmake is not installed yet, please install cmake first" && exit 1 )

# make sure that we have installed node
which node >/dev/null \
    || (echo "node is not installed yet, please install nodejs first" && exit 1)

# make sure that npm have been installed
which npm >/dev/null \
    || (echo "npm is not installed yet, please install npm first" && exit 1)

vim +PlugInstall +qall

# install jsbeautify
cd ~/.vim/plugged/vim-jsbeautify && git submodule update --init --recursive

# install youcompleteme, we prefer python3 if installed
if which python3 > /dev/null; then
    cd ~/.vim/plugged/YouCompleteMe/ && git submodule update --init --recursive && python3 install.py
else
    cd ~/.vim/plugged/YouCompleteMe/ && git submodule update --init --recursive && python install.py
fi

# install autopep8 and flake8 for python code style fix
if which pip3 >/dev/null; then
    pip3 install --upgrade autopep8
    pip3 install --upgrade flake8
else
    pip install --upgrade autopep8
    pip install --upgrade flake8
fi

# install ropevim
if which python3; then
    cd ~/.vim/plugged/ropevim && python setup.py install
else
    cd ~/.vim/plugged/ropevim && python3 setup.py install
fi

# install meteor tern
cd ~/.vim/plugged/tern_for_vim/ && npm install
cd ~/.vim && cp -f post_fix/meteor.json plugged/tern_for_vim/node_modules/tern/defs/meteor.json
echo "Please set your environment variable 'TERM' to 'screen-256color' in order to make the color scheme work"
