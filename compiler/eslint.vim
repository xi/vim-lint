if exists('current_compiler')
  finish
endif
let current_compiler = 'eslint'

CompilerSet makeprg=eslint
CompilerSet errorformat=%f:\ line\ %l\,\ col\ %c\,\ %m
