function! s:RunLinter(prg, format)
    let l:old_makeprg = &makeprg
    let l:old_errorformat = &errorformat
    let l:old_shellpipe = &shellpipe
    let l:old_t_ti = &t_ti
    let l:old_t_te = &t_te

    let &makeprg = a:prg
    let &errorformat = a:format
    let &shellpipe = '&>'
    let &t_ti = ''
    let &t_te = ''

    silent! lmake! '%'

    let &makeprg = l:old_makeprg
    let &errorformat = l:old_errorformat
    let &shellpipe = l:old_shellpipe
    let &t_ti = l:old_t_ti
    let &t_te = l:old_t_te

    return getloclist(winnr())
endfunction

function! lint#Lint()
    lclose
    if !exists('b:lint_prg') || !exists('b:lint_format')
        echon 'No linter configured'
        return
    endif
    if &readonly == 0
        update
    endif
    let l:results = s:RunLinter(b:lint_prg, b:lint_format)
    call filter(l:results, 'v:val.lnum')
    if l:results != []
        lopen
        echon 'Lint found '.len(l:results).' issues'
    else
        lclose
        echon 'Lint OK'
    endif
endfunction
