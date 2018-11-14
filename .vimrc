source ~/.vim/plugins.vim

filetype plugin indent on    " required
filetype on

let jshint2_save = 1

" otherwise vimwiki may have problem
set nocompatible

" change vim behavior
set nobackup
set noswapfile

" Fix setup clipboard take too long time problem
if ! has("nvim")
    set clipboard=exclude:.*
endif


" Don't have a windows style key map
let g:skip_loading_mswin = 1

" For the function list
nnoremap <silent> <F3> :TagbarToggle<CR>


" change leader key to space
let mapleader=" "

" For NERD Tree
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Set so that vim can enable the syntax automatically
syntax on

" Set so that vim do not check spell
set nospell

" Set shift width to 4 blanks
set sw=4

" Set tab stop to 4 blanks
set ts=4

" automatically expand tab to blanks
set expandtab

" Set so that vim can deal better with tab
set smarttab
set shiftround

" This file contains the dictionary so that vim can automatically pop up for
" you
set thesaurus+=$HOME/.vim/mthes/words.txt
autocmd FileType html set dictionary+=$HOME/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k

" Set for a better tab prompt in command line
set wildchar=<Tab> wildmenu wildmode=full

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null



" Set this so that vim can better search
set incsearch

" Search down into subfolders
" Provides tab-completion for all file-related operation
set path+=**

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/node_modules/*
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Better tab complete for file
set wildmenu

" Append tag for perl
"set tags+=perl_tag/tags
"
" For ctrlp
nnoremap <Leader>t  :CtrlPTag<cr>


" For jsbeautify normal mode
autocmd FileType javascript noremap <buffer>  <Leader>fff :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <Leader>fff  :%!python -m json.tool<cr>
" for jsx
autocmd FileType jsx noremap <buffer>  <Leader>fff  :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>fff  :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer>  <Leader>fff  :call CSSBeautify()<cr>

" For jsbeautify visual mode
autocmd FileType javascript vnoremap <buffer>  <Leader>fff :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <Leader>fff :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <Leader>fff :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <Leader>fff :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <Leader>fff :call RangeCSSBeautify()<cr>



" For encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set termencoding=utf-8


set autoindent                    "Preserve current indent on new lines
set textwidth=80                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly

set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop

set rtp+=~/.vim/after

" if has("win32")
"     set guifont=NSimSun:h11
" endif


" set relativenumber
set relativenumber 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

if ( !exists("$vim_username") )
    let g:snips_author = "<username>"
else
    let g:snips_author = $vim_username
endif

if  ( !exists("$vim_email"))
    let g:snips_author_email  = "<email>"
else
    let g:snips_author_email  = $vim_email
endif

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
if ! exists("*Inc")

    function Inc(...)
        let result = g:i
        let g:i += a:0 > 0 ? a:1 : 1
        return result
    endfunction
endif

let g:easytags_file = '~/.vim/tags'

" set the fold method
set fdm=indent
" don't fold
set foldlevelstart=99

" ignore .meteor for ack
let g:ackprg = "ack --ignore-dir .meteor"


" switch between .html and .js
nnoremap <Leader>oh :e %<.html<CR>
nnoremap <Leader>oj :e %<.js<CR>
nnoremap <Leader>sh :split %<.html<CR>
nnoremap <Leader>sj :split %<.js<CR>

" for indentLine
nnoremap <silent> <F5> :IndentLinesToggle<CR>

" toggle number show
nmap <silent> <F6> :set invnumber<CR>

" toggle quick fix after git grep
autocmd QuickFixCmdPost *grep* cwindow


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe black list
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}

" YouCompleteMe conflict with ultisnips 'tab'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" For the shotkey conflict with ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" list all available snip
nnoremap <Leader><tab> :call UltiSnips#ListSnippets()<CR>

" For ultisnip to create snip in correct directory
let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/UltiSnips', 'UltiSnips']

" g:ultisnips_python_style
let g:ultisnips_python_style="sphinx"

" FuzzyFinder exclude node_modules
let g:fuf_file_exclude = 'node_modules/.*'

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Useful mapping for meteor develop with vim
nnoremap <leader>mt :!cp ~/.vim/post_fix/meteor.json meteor.json<CR><CR>
nnoremap <leader>mtp :!cp ~/.vim/post_fix/meteor-tern-project.json .tern-project<CR><CR>
nnoremap <leader>tp :!cp ~/.vim/post_fix/tern-project.json .tern-project<CR><CR>
nnoremap <leader>el :!cp ~/.vim/post_fix/eslintrc .eslintrc<CR><CR>

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

command! -nargs=1 Ss let @/ = <q-args>


" for nerdtree render problem in tmux
" set tenc=latin1

" colorscheme
set background=dark
let g:solarized_termcolors=256
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

autocmd FileType js UltiSnipsAddFiletypes javascript-jsdoc

let g:prettier#config#trailing_comma = 'none'

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'

" source c# related configurations
source $HOME/.vim/csharp.vim

" source fugitive related configurations
source $HOME/.vim/fugitive.vim

" source ctrlp related configurations
source $HOME/.vim/ctrlp.vim

" source ack related configurations
source $HOME/.vim/ack.vim

" source vim test related configurations
source $HOME/.vim/test.vim

" source helper functions
source $HOME/.vim/helpers.vim

" get python document when press K
" autocmd FileType python nnoremap K  :YcmCompleter GetDoc<cr>
autocmd filetype python nmap K :YcmCompleter GetDoc<CR>
autocmd filetype python nmap <C-k> :YcmCompleter GoTo<CR>
autocmd filetype python nmap <leader>ref :YcmCompleter GoToReferences<CR>

" use user defined python instead of the default python
if exists("$vim_ycm_server_python_interpreter")
    let g:ycm_server_python_interpreter = $vim_ycm_server_python_interpreter
endif

" use user defined OmniSharp_server_path if defined
if exists("$vim_OmniSharp_server_path")
    let g:OmniSharp_server_path = $vim_OmniSharp_server_path
endif

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>
endif

" use spell check for python script
autocmd filetype python :set spell

" don't automatically save the session
let g:session_autoload = 'no'
let g:session_autosave = 'no'

