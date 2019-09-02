" settings for c#
augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <Leader>a :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <Leader>a :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <Leader>nm :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<CR>

    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    autocmd FileType cs nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <Leader>sp :OmniSharpStopServer<CR>

    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    " Compile the project
    autocmd FileType cs nnoremap <Leader>c :CompileCSharpProject<CR>

    " Run the project
    autocmd FileType cs nnoremap <Leader>r :RunCSharpProject<CR>

augroup END

command! CompileCSharpProject call s:CompileCSharpProject()
command! RunCSharpProject call s:RunCSharpProject()


let g:OmniSharp_server_path = $HOME . "/.omnisharp/omnisharp-roslyn/OmniSharp.exe"


" use the system installed mono instead
let g:OmniSharp_server_use_mono = 1

function! s:CompileCSharpProject ()
    let l:currentProjectFile = s:GetCurrentProjectFilePath()
    if l:currentProjectFile == ""
        let l:sln_or_dir = OmniSharp#FindSolutionOrDir()
        echo system("dotnet build " . l:sln_or_dir)
    else
        echo system("dotnet build " . l:currentProjectFile)
    endif
endfunction

function! s:RunCSharpProject ()
    let l:currentProjectFile = s:GetCurrentProjectFilePath()
    if l:currentProjectFile == ""
        let l:sln_or_dir = OmniSharp#FindSolutionOrDir()
        echo system("dotnet run " . l:sln_or_dir)
    else
        echo system("dotnet run " . l:currentProjectFile)
    endif
endfunction


function! csharp#AddCurrentFileToProject()

    let currentFile = s:GetCurrentFile()
    let currentProjectFile = s:GetCurrentProjectFilePath()
    call s:AddFileToProject(currentProjectFile, currentFile)

endfunction

function! s:AddFileToProject(currentProjectFile, currentFile)
    let currentFileRelative = s:RelativePath(a:currentFile, a:currentProjectFile)
    echo "currentFileRelative" . currentFileRelative
    silent | split | execute ":edit " . a:currentProjectFile
    let linenr = search('<Compile Include')
    call cursor(linenr, 1)
    let linenr2 = search('</ItemGroup>')
    call cursor(linenr2,1)
    let linenr3 = search(escape(currentFileRelative, '\'))
    call cursor(linenr, 1)
    if linenr3 == 0
        let command = ":put = '    <Compile Include=\\\"" . currentFileRelative  . "\\\" />'"
        execute command
        " sort
        let command = linenr . ',' . linenr2  . " sort"
        execute command
        execute ":wq"
    endif
endfunction

function! s:GetCurrentFile()
    return expand("%:p")
endfunction


function! s:GetCurrentProjectFilePath()
    let currentFile = s:GetCurrentFile()
    let projectFiles = s:GetProjectFiles()
    for file in projectFiles
        let filepath = fnamemodify(file, ":h:p")
        let idx = stridx(currentFile, filepath)
        if idx == 0
            return file
        endif
    endfor
    return ""

endfunction


function! s:GetProjectFiles()
    let sln_or_dir = OmniSharp#FindSolutionOrDir()
    let sln_dir = fnamemodify(sln_or_dir, ":h:p")
    silent | split | execute ":edit " . sln_or_dir
    normal qaq
    glob /project.*.csproj/yank A
    let lines = split(@a, '\n')
    let projectFiles = []
    for line in lines
        let line = split(split(line, ',')[1], '"')[1]
        let projectFile = sln_dir . '\' . line
        call add(projectFiles, projectFile)
    endfor
    bd!
    return projectFiles

endfunction


function!  s:RelativePath(currentFile, currentProjectFile)

    let projectFileDir = fnamemodify(a:currentProjectFile, ":h:p")
    let currentFile = fnamemodify(a:currentFile, ":p")
    let idx = stridx(currentFile, projectFileDir)
    if idx == 0
        echo strpart(currentFile, strlen(projectFileDir)+1)
        return strpart(currentFile, strlen(projectFileDir)+1)
    else
        throw 'Failed to get relative path'
    endif

endfunction

