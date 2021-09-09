set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" source ~/.vim/autoload/plug.vim
set rtp+=~/.vim/
call plug#begin('~/.vim/plugged')


" Plug 'pydoc.vim'

Plug 'godlygeek/tabular'

" For comment
"Plug 'tComment'
Plug 'tomtom/tcomment_vim'

" For html match
Plug 'andymass/vim-matchup'

" For Cpp
Plug 'vim-scripts/OmniCppComplete'


" For tpope/vim-dispatch
Plug 'tpope/vim-dispatch'

" For git
Plug 'tpope/vim-fugitive'

" For easy motion
Plug 'easymotion/vim-easymotion'

" vim-perl
Plug 'vim-perl/vim-perl'

" surround
Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'

Plug 'mileszs/ack.vim'


" jsbeautify
Plug 'maksimr/vim-jsbeautify'


" Plug 'xolox/vim-easytags'

" better white space
Plug 'ntpeters/vim-better-whitespace'

" bootstrap snippets
Plug 'bonsaiben/bootstrap-snippets'

" Lint
Plug 'Shutnik/jshint2.vim'

" tern_for_vim
Plug 'ternjs/tern_for_vim'

" Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe' , { 'for': ['python', 'ipynb', 'cs', 'vim', 'ts', 'js', 'c', 'go' ]}

" SirVer/ultisnips
Plug 'SirVer/ultisnips'

" Optional:
Plug 'honza/vim-snippets'

" Shougo/vimshell.vim
Plug 'Shougo/vimshell.vim'

" Shougo/vimproc.vim
Plug 'Shougo/vimproc.vim'

" mattn/emmet-vim
Plug 'mattn/emmet-vim'

" handlebar
Plug 'mustache/vim-mustache-handlebars'

" coffee script
Plug 'kchmck/vim-coffee-script'

" scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" kien/ctrlp.vim
" Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'

" triglav/vim-visual-increment
Plug 'triglav/vim-visual-increment'

" w0rp/ale
if v:version >= 800
  Plug 'dense-analysis/ale'
endif

" colorscheme
Plug 'altercation/vim-colors-solarized'

" prettier/vim-prettier
Plug 'prettier/vim-prettier'

" rizzatti/dash.vim
Plug 'rizzatti/dash.vim'"

" rdnetto/YCM-Generator
Plug 'rdnetto/YCM-Generator'

"gorodinskiy/vim-coloresque
Plug 'gko/vim-coloresque'

"OmniSharp/omnisharp-vim
" Plug 'OmniSharp/omnisharp-vim'

" Glench/Vim-Jinja2-Syntax
" Plug 'Glench/Vim-Jinja2-Syntax'

" powershell support
Plug 'PProvost/vim-ps1'


" AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'

" tpope/vim-abolish
Plug 'tpope/vim-abolish'

" roxma/vim-paste-easy
Plug 'roxma/vim-paste-easy'


" tpope/vim-repeat
Plug 'tpope/vim-repeat'

" icymind/NeoSolarized
Plug 'icymind/NeoSolarized'

" janko-m/vim-test
Plug 'janko-m/vim-test'

" xolox/vim-session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" FelikZ/ctrlp-py-matcher
Plug 'FelikZ/ctrlp-py-matcher'

" ron89/thesaurus_query.vim
Plug 'ron89/thesaurus_query.vim'

" leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" jeetsukumaran/vim-pythonsense
Plug 'jeetsukumaran/vim-pythonsense'

" lepture/vim-jinja
Plug 'lepture/vim-jinja'

" terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" jmcantrell/vim-virtualenv
Plug 'jmcantrell/vim-virtualenv'

" vim-airline/vim-airline
Plug 'vim-airline/vim-airline'

" tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" tpope/vim-speeddating
Plug 'tpope/vim-speeddating'

"  plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'

" xiguichen/vim-markdown2
" Plug 'xiguichen/vim-markdown2'

" iamcco/markdown-preview.nvim
Plug 'xiguichen/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" ferrine/md-img-paste.vim
Plug 'ferrine/md-img-paste.vim'

" fidian/hexmode
Plug 'fidian/hexmode'

" hashivim/vim-terraform
Plug 'hashivim/vim-terraform'

" python-mode/python-mode
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" call vundle#end()            " required
call plug#end()


