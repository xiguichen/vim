function! refactor#menu()

    let l:refactorCommandsMap = {
        \"Rename": "Rename",
        \"Extract Variable": "ExtractVariable",
        \"Extract Method": "ExtractMethod",
        \"Inline": "Inline"
    \}

    let l:commands = keys(refactorCommandsMap)
    let l:commandsPrompt = map(copy(l:commands), "v:key .. ' ' ..  v:val")
    let l:choice = inputlist(l:commandsPrompt)
    let l:commandToExecute = "refactor#" .. &filetype .. "#" .. l:refactorCommandsMap[l:commands[l:choice]]
    " echo l:commandToExecute
    execute "call " .. l:commandToExecute .. "()"

endfunction
