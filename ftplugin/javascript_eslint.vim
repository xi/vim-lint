if executable('eslint')
    let b:lint_prg = 'eslint -f unix'
    let b:lint_format = '%f:%l:%c: %m'
endif
