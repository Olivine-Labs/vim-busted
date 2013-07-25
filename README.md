# busted.vim

This is a lightweight Busted runner for Vim.

Based on [vim-rspec](https://github.com/thoughtbot/vim-rspec).

## Installation

Recommended installation with [vundle](https://github.com/gmarik/vundle):

```vim
Bundle 'Olivine-Labs/vim-busted'
```

If using zsh on OS X it may be necessary to run move `/etc/zshenv` to `/etc/zshrc`.

## Example of key mappings

```vim
" Busted.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
```

## Configuration

Overwrite `g:busted_command` variable to execute a custom command.

Example:

```vim
let g:busted_command = "!busted {spec}"
```

This `g:busted_command` variable can be used to support any number of test
runners or pre-loaders. For example, you can use
[Dispatch](https://github.com/tpope/vim-dispatch) and
[Zeus](https://github.com/burke/zeus) together with the following:

```vim
let g:busted_command = "Dispatch zeus busted {spec}"
```

## License

busted.vim is copyright © 2013 Olivine Labs. It is free software, and may be
redistributed under the terms specified in the `LICENSE` file.

The names and logos for Olivine Labs are trademarks of Olivine Labs, LLC.
