# vim

### How to use this repository
This repository using git submodule to manage bundles. To use this repository:
```bash
git clone https://github.com/xiguichen/vim.git ~/.vim
```
After that you can copy '.vimrc' in the repository to your home directory


### Install
Before run install.sh, some preparation need to be done:
* cmake is installed
* nodejs is installed
* python is installed
Run command:
```bash
cd ~/.vim
sudo ./install.sh
```

### Extra work to do in windows
* install vim from : https://github.com/vim/vim-win32-installer/releases
* download and install cmake: https://cmake.org/download/  ( Make sure cmake in PATH environment variable )
* installed related python according to vim release page
* install tern_for_vim with "npm install"
* install youcompleteme
  * git submodule update --init --recursive
  * python install.py --clang-completer --tern-completer
  * More info: https://github.com/Valloric/YouCompleteMe#windows

### Use Neovim
* install neovim
    * get the source code from https://github.com/neovim/neovim
    * untar the zip file
    * make CMAKE_BUILD_TYPE=RelWithDebInfo
    * make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/full/path/"
    * make install
    * install the neovim plugin in vim
        * pip install neovim
        * pip install neovim --user
    * make a link of the original vim configuration file
        * mkdir -p ~/.config/nvim/
        * ln -s ~/.vimrc ~/.config/nvim/init.vim
