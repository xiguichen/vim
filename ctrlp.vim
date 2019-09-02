nnoremap <a-p> :CtrlP .<CR>

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore Out --ignore bin --ignore packages --ignore *.dll --ignore obj -g ""'
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

