let s:signids = []

function! s:RunLinter(prg, format)
    let l:old_grepprg = &grepprg
    let l:old_grepformat = &grepformat
    let l:old_shellpipe = &shellpipe
    let l:old_t_ti = &t_ti
    let l:old_t_te = &t_te

    let &grepprg = a:prg
    let &grepformat = a:format
    let &shellpipe = '>'
    let &t_ti = ''
    let &t_te = ''

    silent! grep! '%'

    let &grepprg = l:old_grepprg
    let &grepformat = l:old_grepformat
    let &shellpipe = l:old_shellpipe
    let &t_ti = l:old_t_ti
    let &t_te = l:old_t_te

    return getqflist()
endfunction

function! s:PlaceMarkers(results)
    execute 'sign define lint text=! texthl=Error'

    for i in s:signids
        execute ':sign unplace '.i
    endfor
    let s:signids = []

    let l:id = 100
    for result in a:results
        if result.lnum
            execute ':sign place '.l:id.' line='.result.lnum.' name=lint file='.expand('%:p')
            let s:signids += [l:id]
            let l:id += 1
        endif
    endfor
endfunction

function s:CheckOptions()
    if !exists('g:lint_prg')
        echoerr 'No linter configured (g:lint_prg)'
        return 0
    elseif !exists('g:lint_format')
        echoerr 'No format configured (g:lint_format)'
        return 0
    else
        let l:executable = split(g:lint_prg)[0]
        if !executable(l:executable)
            echoerr 'Linter '.l:executable.' cannot be executed'
            return 0
        endif
    endif
    return 1
endfunction

function! lint#Lint()
    if !s:CheckOptions()
        return
    endif
    if &readonly == 0
        update
    endif
    let l:results = s:RunLinter(g:lint_prg, g:lint_format)
    call filter(l:results, 'v:val.lnum')
    call s:PlaceMarkers(l:results)
    cwindow
    if l:results != []
        echon 'Lint found '.len(l:results).' issues'
    else
        echon 'Lint OK'
    endif
endfunction
