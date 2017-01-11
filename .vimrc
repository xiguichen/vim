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
set clipboard=exclude:.*

" Don't have a windows style key map
let g:skip_loading_mswin = 1

" For the function list
nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F3> :TlistUpdate<CR>


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
set thesaurus+=$HOME/mthes/mthesaur.txt
set dictionary+=$HOME/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k


" Set for a better tab prompt in command line
set wildchar=<Tab> wildmenu wildmode=full

" Set this so that vim can better search
set incsearch

" Append tag for perl
"set tags+=perl_tag/tags
"
" For fuzzyfinder
nnoremap <Leader>ff :FufFile **/<cr>
nnoremap <Leader>fb :FufBuffer<cr>
nnoremap <Leader>ft :FufTag<cr>
nnoremap <Leader>fr :FufRenewCache<cr>

" For vimwki
nnoremap <Leader>wf :VimwikiSearch /

" For jsbeautify normal mode
autocmd FileType javascript noremap <buffer>  <Leader>fff :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <Leader>fff  :call JsonBeautify()<cr>
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
set encoding=utf-8


set autoindent                    "Preserve current indent on new lines
set textwidth=80                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly

set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop

set rtp+=~/.vim/after

if has("win32")
    set guifont=NSimSun:h11
endif


" set relativenumber
set nu
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

if ( !exists("$username") )
    let g:snips_author = "chenxigui"
else
    let g:snips_author = $username
endif

if  ( !exists("$email"))
    let g:snips_author_email  = "chenxigui_192930@163.com"
else
    let g:snips_author_email  = $email
endif

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
function Inc(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction

let g:easytags_file = '~/.vim/tags'

" set the fold method
set fdm=indent
" don't fold
set foldlevelstart=99

" ignore .meteor for ack
let g:ackprg = "ack --ignore-dir .meteor"

" d8
let d8_command="/usr/bin/d8"

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
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" FuzzyFinder exclude node_modules
let g:fuf_file_exclude = 'node_modules/.*'
