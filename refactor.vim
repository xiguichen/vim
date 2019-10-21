function refactor#menu() abort

    let l:refactorCommandsMap = s:refactorCommands()
    echo l:refactorCommandsMap
    echo type(l:refactorCommandsMap)
    let l:choice = inputlist(s:GetMainMenu())
    let l:commandToExecute = "refactor#" .. &filetype .. "#" .. l:refactorCommandsMap[l:commands[l:choice]]
    " echo l:commandToExecute
    execute "call " .. l:commandToExecute .. "()"

endfunction

function! s:refactorCommands()
    let l:refactorCommandsMap = {
        \"Rename": "Rename",
        \"Extract Variable": "ExtractVariable",
        \"Extract Method": "ExtractMethod",
        \"Inline": "Inline"
    \}
    return l:refactorCommandsMap
endfunction

function! s:GetMainMenu()
    let l:result = []
    let l:i = 0
    for l:command in keys(s:refactorCommandsMap())
        l:result[l:i] = l:i . " " . l:command
        l:i+=1
    endfor
    return l:result
endfunction
