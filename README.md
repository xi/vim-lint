# vim-lint

`vim-lint` is a vim plugin that runs the currently open file through a
linter.

It is much simpler than [syntastic][1]. In fact, the implementation is
basically a simplified version of [vim-flake8][2]. It basically has no options.
However, much like syntastic, you can configure `vim-lint` to use many
different linters (but only one per file type).

[1]: https://github.com/vim-syntastic/syntastic/
[2]: https://github.com/nvie/vim-flake8/

## Usage

Press `<F7>` to run a linter on the current file.

For most file types you will probably have to install and configure a linter
first:

```viml
" ftplugin/python_lint.vim
if executable('flake8')
    let g:lint_prg = 'flake8 --ignore=W191,W503'
    let g:lint_format = '%f:%l:%c: %m'
endif
```

For details about `g:line_format`, see `:help errorformat`.

To run the linter automatically on save, add the following line to your
`.vimrc` file:

```viml
autocmd BufWritePost * call Lint()
```
