if exists('current_compiler')
  finish
endif
let current_compiler = 'shellcheck'

CompilerSet makeprg=shellcheck\ -f\ gcc
CompilerSet errorformat=%f:%l:%c:\ %m,%f:%l:\ %m
