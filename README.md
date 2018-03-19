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
* install vim from : https://bintray.com/veegee/generic/vim_x64/
* download and install cmake: https://cmake.org/download/  ( Make sure cmake in PATH environment variable )
* install python 2.7.10 ( 2.7.11 does not work with above vim )
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
