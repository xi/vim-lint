if executable('stylelint')
    let b:lint_prg = 'stylelint --syntax scss -f unix'
    let b:lint_format = '%f:%l:%c: %m'
endif
