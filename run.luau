print("require module_tl")
local m_tl = require("./folder/module_tl")
print("require module_fn")
local m_fn = require("./folder/module_fn")

print("call m_tl.get()")
print(m_tl.get())
print("call m_fn.get()")
print(m_fn.get())

print("done")
