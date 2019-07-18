augroup youcompleteme_commands
    autocmd!

    " python related configurations
    autocmd FileType python nnoremap <buffer> <Leader>dc :YcmCompleter GetDoc<CR>
    autocmd FileType python nnoremap <buffer> <Leader>fu :YcmCompleter GoToReferences<CR>
    autocmd FileType python nnoremap <buffer> gd :YcmCompleter GoTo<CR>

    " rename for javascript and typescript
    autocmd filetype ts nmap <F2> :YcmCompleter Rename<F12>

augroup END

" use user defined python instead of the default python
if exists("$vim_ycm_server_python_interpreter")
    let g:ycm_server_python_interpreter = $vim_ycm_server_python_interpreter
endif

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


