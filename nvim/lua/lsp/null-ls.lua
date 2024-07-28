local dependencies = { "null-ls" }
local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start null-ls.lua")
if not status_ok then
  return
end

local null_ls = unpack(deps)

local builtins = null_ls.builtins
null_ls.setup({
  sources = {
    builtins.code_actions.gitsigns,

    builtins.formatting.stylua,
    builtins.formatting.eslint_d,
    builtins.formatting.prettierd,
  },
})
