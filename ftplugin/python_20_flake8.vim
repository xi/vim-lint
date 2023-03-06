if executable('flake8') && !exists('b:lint_prg')
    let b:lint_prg = 'flake8'
    let b:lint_format =
        \ 'error: Failed to parse %f:%l:%c: %m,' .
        \ 'error: Failed to parse %f:%l: %m,' .
        \ '%f:%l:%c: %m,' .
        \ '%f:%l: %m'
endif
