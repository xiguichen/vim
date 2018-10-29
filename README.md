# vim

### Requirements
Before run install.sh, some preparation need to be done:
* git is installed
* cmake is installed
* nodejs is installed
* python or python3 is installed
*NOTE*
You can install chocolatey for easier install dependencies in windows 10
https://chocolatey.org/

### Automatic install in Linux/Mac
Run command:
```bash
cd ~/.vim
sudo ./install.sh
```

### Manual install in Windows
* install vim from : https://github.com/vim/vim-win32-installer/releases
* download and install cmake: https://cmake.org/download/  ( Make sure cmake in PATH environment variable )
* install nodejs if not already installed
* installed related python according to vim release page
* create directory bundle in .vim directory
* clone repository:
    * git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim --depth=1
* create a _vimrc in your home directory with "source $HOME/.vim/.vimrc"
* copy .vimrc in this repository to your home directory and rename it to \_vimrc
* start vim and run command: PluginInstall
* install tern_for_vim with "npm install"
    * cd ~/.vim/bundle/tern_for_vim/
    * npm install
* install youcompleteme
    * cd ~/.vim/bundle/YouCompleteMe/
    * git submodule update --init --recursive
    * python install.py --clang-completer --tern-completer
    * More info: https://github.com/Valloric/YouCompleteMe#windows
* install flake8 for python lint
    * pip install flake8
* install autopep8
    * pip install autopep8 

### Configurations
In order to make this repository common for all people. User specified
configurations should be put into the environment variable instead of put into
.vimrc directly. we support the following environment variables:
* vim_username
    * this is the username that will be used for code snips
* vim_email
    * this is the email that will be used for code snips
* vim_ycm_server_python_interpreter
    * this is the python that you want to use for start YouCompleteMe

### Optional: Use Neovim
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
