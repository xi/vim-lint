if executable('shellcheck') && !exists('b:lint_prg')
    let b:lint_prg = 'shellcheck -f gcc'
    let b:lint_format = '%f:%l:%c: %m'
endif
