if executable('jshint') && !exists('b:lint_prg')
    let b:lint_prg = 'jshint --reporter unix'
    let b:lint_format = '%f:%l:%c: %m'
endif
