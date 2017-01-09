#vim

### How to use this repository
This repository using git submodule to manage bundles. To use this repository:
```bash
git clone https://github.com/xiguichen/vim.git ~/.vim
cd ~/.vim/
git submodule init
git submodule update
```
After that you can copy '.vimrc' in the repository to your home directory


### Extra work to do in windows
* install vim from : https://bintray.com/veegee/generic/vim_x64/
* download and install cmake: https://cmake.org/download/  ( Make sure cmake in PATH environment variable )
* install python 2.7.10 ( 2.7.11 does not work with above vim )
* install tern_for_vim with "npm install"
* install youcompleteme
  * git submodule update --init --recursive
  * python install.py --clang-completer --tern-completer
  * More info: https://github.com/Valloric/YouCompleteMe#windows


### Install
Run command:
```bash
cd ~/.vim
sudo ./install.sh
```
