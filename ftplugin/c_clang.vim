if executable('clang')
    let g:lint_prg = 'clang -x c -fsyntax-only'
    let g:lint_format = '%f:%l:%c: %m'
endif
