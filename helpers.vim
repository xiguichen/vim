function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

command! Fanyi call Fanyi()

function! Fanyi()
    let s:current_word = expand("<cword>")
    let s:command = "Dispatch fanyi " . s:current_word
    execute s:command
endfunction

command! Css :set omnifunc=csscomplete#CompleteCSS
command! Html :set omnifunc=htmlcomplete#CompleteTags

