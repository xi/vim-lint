command! Lint call lint#Lint()
command! LintReset call lint#Reset()

nnoremap <F7> :Lint<CR>
