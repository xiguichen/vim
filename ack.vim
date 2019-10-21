let g:ackprg = 'ag --nogroup --nocolor --column'
map <leader>/ :Ack 
map <leader>#  :SearchCurrent<CR>

command! SearchCurrent call SearchCurrent()
function! SearchCurrent()
    let s:current_word = expand("<cword>")
    let s:command = "Ack " . s:current_word
    execute s:command
endfunction
