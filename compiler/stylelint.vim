if exists('current_compiler')
  finish
endif
let current_compiler = 'stylelint'

CompilerSet makeprg=stylelint -f unix
CompilerSet errorformat=%f:%l:%c:\ %m,%f:%l:\ %m
