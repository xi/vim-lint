if executable('php')
    let g:lint_prg = 'php -l'
    let g:lint_format = '%m in %f on line %l'
endif
