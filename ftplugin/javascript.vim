if executable('eslint')
    compiler eslint
elseif executable('jshint')
    compiler jshint
endif
