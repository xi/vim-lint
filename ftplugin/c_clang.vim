if executable('clang') && !exists('b:lint_prg')
    let b:lint_prg = 'clang -x c -fsyntax-only'
    let b:lint_format = '%f:%l:%c: %m'
endif
