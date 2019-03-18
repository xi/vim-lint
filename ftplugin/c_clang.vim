if executable('clang')
    let b:lint_prg = 'clang -x c -fsyntax-only'
    let b:lint_format = '%f:%l:%c: %m'
endif
