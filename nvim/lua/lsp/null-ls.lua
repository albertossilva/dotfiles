local dependencies = { "null-ls" }
local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start null-ls.lua")
if not status_ok then
  return
end

local null_ls = unpack(deps)

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.eslint_d,
    diagnostics.eslint_d,
    code_actions.eslint_d,
    diagnostics.tsc,

    diagnostics.golangci_lint,
    formatting.goimports_reviser,

    code_actions.cspell,
    diagnostics.cspell.with({
      disabled_filetype = { "NvimTree", "NvimTree_1" },
    }),

    formatting.stylua,
    code_actions.gitsigns,

    code_actions.ltrs,
    diagnostics.ltrs
  },
})
