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
endfunction

function! lint#Lint()
    if &makeprg == 'true'
        echon 'No linter configured'
        return
    endif
    if &readonly == 0
        update
    endif
    call s:RunCompiler()
endfunction
