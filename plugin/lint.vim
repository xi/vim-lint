command! Lint call lint#Lint()
nnoremap <F7> :Lint<CR>
autocmd QuitPre * lclose
