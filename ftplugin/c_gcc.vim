if executable('gcc') && !exists('b:lint_prg')
    let b:lint_prg = 'gcc -c -Wall $INCS'
    let b:lint_format = '%f:%l:%c: %m'
endif
