if executable('stylelint')
    let b:lint_prg = 'stylelint -f unix'
    let b:lint_format = '%f:%l:%c: %m'
endif
