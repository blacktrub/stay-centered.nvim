# stay-centered.nvim

## Install

Using Packer:
```
use "arnamak/stay-centered.nvim"
```

## Enable
```
require("stay-centered").setup()
```

## Summary

A simple `autocmd` that keeps your cursor at the center of the screen in all contexts.
No jerkiness when changing modes or jumping to different LOCs.

Replacement for what you might typically do in keybindings such as:
```
nnoremap "j" "jzz"
nnoremap "n" "nzzzv"
...
etc
```

Using `autocmd` and `CursorMoved`/`CursorMovedI` events, `zz` is applied to every keystroke that would change the cursor position.
Minorly optimized by only applying `zz` to vertical line movement.

Should not get in the way of plugins like `auto-pairs` or `compe`, which tend to have their own mappings for `<CR>`.

## Options

If there are certain filetypes or buftypes you'd like to omit from this functionality, you can use `setup` to do that:

```
require("stay-centered").setup({
  skip_filetypes = {"lua", "typescript"},
  skip_buftypes = {"terminal", "quickfix"},
})
```

The filetype is determined by the vim filetype, not the file extension. In order to get the filetype, open a file and run the command:

```
:lua print(vim.bo.filetype)
```

and for buftype
```
:lua print(vim.bo.buftype)
```

#### Example

```
// someFile.ts

const myVar
...etc

:lua print(vim.bo.filetype)
#=> typescript

:lua print(vim.bo.buftype)
#=> quickfix
```

```
// plugins.lua
require("stay-centered").setup({
  skip_filetypes = {"typescript"},
  skip_buftypes = {"terminal", "quickfix"},
})
```
