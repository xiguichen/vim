set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'pydoc.vim'

Plugin 'tabular'

" For comment
Plugin 'tComment'

" For html match
Plugin 'matchit.zip'

" For Cpp
Plugin 'OmniCppComplete'

" For git
Plugin 'tpope/vim-fugitive'

" For easy motion
Plugin 'easymotion/vim-easymotion'

" For syntax check
" Plugin 'scrooloose/syntastic"

" For automatically quote completion
Plugin 'Raimondi/delimitMate'

" vim-perl
Plugin 'vim-perl/vim-perl'

" Tag list
" Plugin 'taglist.vim'

" surround
Plugin 'tpope/vim-surround'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'AutoComplPop'
Plugin 'c9s/perlomni.vim'

Plugin 'L9'
Plugin 'vimwiki/vimwiki'

Plugin 'javacomplete'

Plugin 'Tagbar'
Plugin 'perl-support.vim'


" color scheme
Plugin 'endel/vim-github-colorscheme'

" Plugin 'vim-colorschemes'
Plugin 'flazz/vim-colorschemes'

Plugin 'mileszs/ack.vim'


" jsbeautify
Plugin 'maksimr/vim-jsbeautify'

" Optional:
Plugin 'honza/vim-snippets'

Plugin 'vim-misc'
" Plugin 'xolox/vim-easytags'

" better white space
Plugin 'ntpeters/vim-better-whitespace'

" bootstrap snippets
Plugin 'bonsaiben/bootstrap-snippets'

" Lint
Plugin 'Shutnik/jshint2.vim'

" tern_for_vim
Plugin 'ternjs/tern_for_vim'

" Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" SirVer/ultisnips
Plugin 'SirVer/ultisnips'

" Shougo/vimshell.vim
Plugin 'Shougo/vimshell.vim'

" Shougo/vimproc.vim
Plugin 'Shougo/vimproc.vim'

" gorodinskiy/vim-coloresque
Plugin 'gorodinskiy/vim-coloresque'

" mattn/emmet-vim
Plugin 'mattn/emmet-vim'

" rstacruz/sparkup
Plugin 'rstacruz/sparkup'

" handlebar
Plugin 'mustache/vim-mustache-handlebars'

" coffee script
Plugin 'kchmck/vim-coffee-script'

" scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" w0rp/ale
Plugin 'w0rp/ale'

" ctrlp
Plugin 'ctrlp.vim'


call vundle#end()            " required
