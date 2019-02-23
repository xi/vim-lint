if executable('stylelint')
    let g:lint_prg = 'stylelint -f unix'
    let g:lint_format = '%f:%l:%c: %m'
endif
