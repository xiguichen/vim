set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'pydoc.vim'

Plugin 'tabular'

" For comment
"Plugin 'tComment'
Plugin 'tomtom/tcomment_vim'

" For html match
Plugin 'matchit.zip'

" For Cpp
Plugin 'OmniCppComplete'


" For tpope/vim-dispatch
Plugin 'tpope/vim-dispatch'

" For git
Plugin 'tpope/vim-fugitive'

" For easy motion
Plugin 'easymotion/vim-easymotion'

" For syntax check
" Plugin 'scrooloose/syntastic"

" For automatically quote completion
" Plugin 'Raimondi/delimitMate'

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




Plugin 'mileszs/ack.vim'


" jsbeautify
Plugin 'maksimr/vim-jsbeautify'


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

" Optional:
Plugin 'honza/vim-snippets'

" Shougo/vimshell.vim
Plugin 'Shougo/vimshell.vim'

" Shougo/vimproc.vim
Plugin 'Shougo/vimproc.vim'

" mattn/emmet-vim
Plugin 'mattn/emmet-vim'

" handlebar
Plugin 'mustache/vim-mustache-handlebars'

" coffee script
Plugin 'kchmck/vim-coffee-script'

" scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" kien/ctrlp.vim
" Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" triglav/vim-visual-increment
Plugin 'triglav/vim-visual-increment'

" w0rp/ale
if v:version >= 800
  Plugin 'w0rp/ale'
endif

" colorscheme
Plugin 'altercation/vim-colors-solarized'

" prettier/vim-prettier
Plugin 'prettier/vim-prettier'

" rizzatti/dash.vim
Plugin 'rizzatti/dash.vim'"

" rdnetto/YCM-Generator
Plugin 'rdnetto/YCM-Generator'

"gorodinskiy/vim-coloresque
Plugin 'gorodinskiy/vim-coloresque'

"OmniSharp/omnisharp-vim
Plugin 'OmniSharp/omnisharp-vim'
" Glench/Vim-Jinja2-Syntax
Plugin 'Glench/Vim-Jinja2-Syntax'

" powershell support
Plugin 'PProvost/vim-ps1'


" AndrewRadev/splitjoin.vim
Plugin 'AndrewRadev/splitjoin.vim'

" tpope/vim-abolish
Plugin 'tpope/vim-abolish'

" roxma/vim-paste-easy
Plugin 'roxma/vim-paste-easy'


" tpope/vim-repeat
Plugin 'tpope/vim-repeat'

" icymind/NeoSolarized
Plugin 'icymind/NeoSolarized'

" janko-m/vim-test
Plugin 'janko-m/vim-test'

" xolox/vim-session
Plugin 'xolox/vim-session'

" FelikZ/ctrlp-py-matcher
Plugin 'FelikZ/ctrlp-py-matcher'

call vundle#end()            " required
