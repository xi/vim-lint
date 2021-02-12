if executable('php') && !exists('b:lint_prg')
    let b:lint_prg = 'php -l'
    let b:lint_format = '%m in %f on line %l'
endif
