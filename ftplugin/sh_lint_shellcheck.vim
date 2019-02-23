if executable('shellcheck')
    let g:lint_prg = 'shellcheck -f gcc'
    let g:lint_format = '%f:%l:%c: %m'
endif
