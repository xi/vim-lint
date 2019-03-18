if executable('eslint')
    let b:lint_prg = 'eslint'
    let b:lint_format = '%f: line %l\, col %c\, %m'
endif
