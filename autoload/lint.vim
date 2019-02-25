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

    silent! make! '%'

    let &makeprg = l:old_makeprg
    let &errorformat = l:old_errorformat
    let &shellpipe = l:old_shellpipe
    let &t_ti = l:old_t_ti
    let &t_te = l:old_t_te

    return getqflist()
endfunction

function! lint#Lint()
    if !exists('g:lint_prg') || !exists('g:lint_format')
        echon 'No linter configured'
        return
    endif
    if &readonly == 0
        update
    endif
    let l:results = s:RunLinter(g:lint_prg, g:lint_format)
    call filter(l:results, 'v:val.lnum')
    if l:results != []
        copen
        echon 'Lint found '.len(l:results).' issues'
    else
        cclose
        echon 'Lint OK'
    endif
endfunction
