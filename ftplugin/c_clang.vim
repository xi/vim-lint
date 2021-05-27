if executable('clang') && !exists('b:lint_prg')
    let b:lint_prg = 'clang -c -Wall'
    let b:lint_format = '%f:%l:%c: %m'
endif
