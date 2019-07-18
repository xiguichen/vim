if !exists('g:test#csharp#nunit#file_pattern')
  let g:test#csharp#nunit#file_pattern = '\v\.cs$'
endif

function! test#csharp#nunit#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#csharp#nunit#file_pattern
    if exists('g:test#csharp#runner')
      return g:test#csharp#runner ==# 'nunit'
    else
      return s:is_using_dotnet_nunit_cli(a:file)
          \ && (search('using NUnit.Framework', 'n') > 0)
          \ && (search('[(TestFixture).*]', 'n') > 0)
    endif
  endif
endfunction

function! test#csharp#nunit#build_position(type, position) abort
  let l:found_nearest = 0
  if a:type ==# 'nearest'
    let l:found_nearest = 1
    let l:n = test#base#nearest_test(a:position, g:test#csharp#patterns)
    let l:fully_qualified_name = join(l:n['namespace'] + l:n['test'], '.')
    if !empty(l:fully_qualified_name)
      return [s:test_command(l:n), l:fully_qualified_name]
    endif
  endif
  if a:type ==# 'file' || l:found_nearest
    let l:position = a:position
    let l:position['line'] = '$'
    let l:n = test#base#nearest_test(l:position, g:test#csharp#patterns)

    " Discard the test name and use the name space with the test class name
    let l:n['test'] = []
    let l:fully_qualified_name = join(l:n['namespace'][:1], '.')

    if !empty(l:fully_qualified_name)
      return [s:test_command(l:n), l:fully_qualified_name]
    else
      throw 'Could not find any tests.'
    endif
  endif

  return []
endfunction

function! test#csharp#nunit#build_args(args) abort
  let l:args = a:args
  call add(l:args, s:get_dll_path(@%))
  call add(l:args, '--noresult')
  return [substitute(join(l:args, ' '), '-test= ', '-test=', '')]
endfunction

function! test#csharp#nunit#executable() abort
  return 'nunit3-console.exe'
endfunction

function! s:test_command(name) abort
    return  '-test='
  " if !empty(a:name['test'])
  "   return '-method'
  " elseif len(a:name['namespace']) > 1
  "   return '-class'
  " else
  "   return '-namespace'
  " endif
endfunction

function! s:is_using_dotnet_nunit_cli(file) abort
  let l:project_path = test#csharp#get_project_path(a:file)
  return filereadable(l:project_path)
      \ && match(
          \ readfile(l:project_path),
          \ 'nunit.framework')
endfunction

function! s:get_dll_path(file)
  let l:project_path = test#csharp#get_project_path(a:file)
  return s:get_output_base_dir(l:project_path) . '\' . s:get_output_file_name(l:project_path)
endfunction

function! s:get_build_command(file)
  let l:project_path = test#csharp#get_project_path(a:file)
  return "dotnet build " . l:project_path
endfunction

function! s:get_output_base_dir(project_path)
    let l:project_base = fnamemodify(a:project_path, ':p:h')
    let l:output_base = 'bin\debug'
    return l:project_base . '\' . l:output_base
endfunction

function! s:get_output_file_name(project_path)
    let l:project_base = fnamemodify(a:project_path, ':p:h')
    for line in readfile(a:project_path)
        if line =~ '\v^.*\<AssemblyName\>(.*)\</AssemblyName\>'
            let l:name = substitute(line, '\v^.*\<AssemblyName\>(.*)\</AssemblyName\>', '\1', '')
            return l:name . ".dll"
        endif
    endfor
endfunction
