## Zune '../' require repro

When requiring a module in a parent directory (with `../` prefix), when required from within a function, Zune seems to be unable to find the file.

However when required from the top-level of a file, the issue does not occur.

This project is laid out like so:

```
├── folder
│   ├── module_tl.luau
│   └── module_fn.luau
├── sub_module.luau
└── run.luau
```

Both `module_tl` and `module_fn` require `sub_module` using `require("../sub_module")`. The difference being:

- `module_tl` (top-level) requires it at the top-=level scope of the file
- `module_fn` (function) requires it from within a function that gets called later

in `run.luau`, both are called, with `tl` called first (works), and `fn` called second `FileNotFound` error.

I get this output:
```
❯ zune run run.luau
require module_tl
require module_fn
call m_tl.get()
<table: 0x145019ca8> {
    foo = "foo", 
}
call m_fn.get()
[string "folder/module_fn.luau"]:3: FileNotFound
[C] function require
[string "folder/module_fn.luau"]:3 function get
[string "run.luau"]:9
```
with:
```
❯ zune --version   
zune: 0.4.2
luau: 0.647
```
