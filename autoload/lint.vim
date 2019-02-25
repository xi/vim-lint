function! s:RunCompiler()
    let l:old_shellpipe = &shellpipe
    let l:old_t_ti = &t_ti
    let l:old_t_te = &t_te

    let &shellpipe = '&>'
    let &t_ti = ''
    let &t_te = ''

    silent! make! '%'

    let &shellpipe = l:old_shellpipe
    let &t_ti = l:old_t_ti
    let &t_te = l:old_t_te

    return getqflist()
endfunction

function! lint#Lint()
    if &readonly == 0
        update
    endif
    let l:results = s:RunCompiler()
    call filter(l:results, 'v:val.lnum')
    if l:results != []
        copen
        echon 'Lint found '.len(l:results).' issues'
    else
        cclose
        echon 'Lint OK'
    endif
endfunction
