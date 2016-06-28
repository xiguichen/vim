source ~/.vim/plugins.vim

filetype plugin indent on    " required
filetype on

let jshint2_save = 1


filetype on
" otherwise vimwiki may have problem
set nocompatible

" change vim behavior
set nobackup
set noswapfile

" Don't have a windows style key map
let g:skip_loading_mswin = 1

" For the function list
nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F3> :TlistUpdate<CR>


" change leader key to space
let mapleader=" "

" For emmet
" let g:user_emmet_leader_key='<Leader>em'


" For NERD Tree
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Set so that vim can enable the syntax automatically
syntax on

" Set so that vim can do spell check
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

" Set so that vim can deal with different file type
filetype plugin on
filetype plugin indent on

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

" For jsbeautify
noremap <Leader>jjb :call JsBeautify()<cr>
noremap <Leader>jhb :call HtmlBeautify()<cr>
noremap <Leader>jcb :call CssBeautify()<cr>

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

" For the shotkey conflict with ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" For encoding
set encoding=utf-8


set autoindent                    "Preserve current indent on new lines
"set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly

set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop

set rtp+=~/.vim/after


" vimwiki settings
let vimwiki_path=$HOME.'/vimwiki/'
let vimwiki_html_path=$HOME.'/vimwiki_html/'
let vimwiki2_path=$HOME.'wiki/web_develop//vimwiki/'
let vimwiki2_html_path=$HOME.'wiki/web_develop/vimwiki_html/'
let g:vimwiki_list = [{'path_html':vimwiki_html_path,
                       \ 'template_path':vimwiki_html_path.'assets/',
                       \ 'template_default': 'default',
                       \ 'template_ext': '.tpl',
                       \ 'auto_export': 0},
                       \ {'path_html':vimwiki2_html_path,
                       \ 'template_path':vimwiki2_html_path.'assets/',
                       \ 'template_default': 'default',
                       \ 'template_ext': '.tpl',
                       \ 'auto_export': 0} ]

let vimwiki_1 = {}
let vimwiki_1.path             = '~/wiki/default/vimwiki'
let vimwiki_1.path_html        = '~/wiki/default/vimwiki_html'
let vimwiki_1.template_path    = '~/wiki/default/vimwiki_html/assets'
let vimwiki_1.template_default = 'default'
let vimwiki_1.template_ext     = '.tpl'
let vimwiki_1.auto_export      = 0

let vimwiki_2 = {}
let vimwiki_2.path             = '~/wiki/web_develop/vimwiki'
let vimwiki_2.path_html        = '~/wiki/web_develop/vimwiki_html'
let vimwiki_2.template_path    = '~/wiki/web_develop/vimwiki_html/assets'
let vimwiki_2.template_default = 'default'
let vimwiki_2.template_ext     = '.tpl'
let vimwiki_2.auto_export      = 0

let g:vimwiki_list = [vimwiki_1, vimwiki_2]


" This color scheme is better for read
" if has("gui_running")
"     colorscheme Chasing_Logic
" else
"     colorscheme Chasing_Logic
" endif

if has("win32")
    set guifont=NSimSun:h11
endif



" set relativenumber
set nu
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

if ( !exists("$email") )
    let g:snips_author = "chenxigui"
else
    let g:snips_author = $username
endif

if  ( !exists("$username"))
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

" 设置折叠方式为缩进方式
set fdm=indent
" 不折叠代码
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
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsListSnippets="<c-s-tab>"
"
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" FuzzyFinder exclude node_modules
let g:fuf_file_exclude = 'node_modules/.*'
