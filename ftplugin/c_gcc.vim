if executable('gcc') && !exists('b:lint_prg')
    let b:lint_prg = 'gcc -c -Wall'
    let b:lint_format = '%f:%l:%c: %m'
endif
