if executable('php')
    let b:lint_prg = 'php -l'
    let b:lint_format = '%m in %f on line %l'
endif
