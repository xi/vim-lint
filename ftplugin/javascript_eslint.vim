if executable('eslint')
    let g:lint_prg = 'eslint'
    let g:lint_format = '%f: line %l\, col %c\, %m'
endif
