if executable('jshint')
    let b:lint_prg = 'jshint'
    let b:lint_format = '%f: line %l\, col %c\, %m'
endif
