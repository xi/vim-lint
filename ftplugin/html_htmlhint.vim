if executable('htmlhint') && !exists('b:lint_prg')
    let b:lint_prg = 'htmlhint -f unix'
    let b:lint_format = '%f:%l:%c: %m'
endif
