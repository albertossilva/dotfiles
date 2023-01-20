local dependencies = { "cmp_nvim_lsp" }
local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start lsp.handlers")
if not status_ok then
  return
end

local function set_keymap(keymaps, opts)
  opts = opts or { noremap = true, silent = true }
  for keymap, action in pairs(keymaps) do
    vim.keymap.set("n", keymap, action, opts)
  end
end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_highlight_document", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_highlight_document",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_highlight_document",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })

    -- make CursorHold trigger after 1 second
    vim.opt.updatetime = 1000
  end
end

vim.diagnostic.config({
  -- virtual_text = false, -- disable the annoying text on the right side of the line
  update_in_insert = true, -- check if this option makes larger codebases too slow
})

local M = {}
local cmp_nvim_lsp = unpack(deps)
M.capabitilies = cmp_nvim_lsp.default_capabilities()
M.on_attach = function(client, buffer)
  local bufopts = { noremap = true, silent = true, buffer = buffer }
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
  set_keymap({
    ["<leader>D"] = vim.lsp.buf.type_definition,
    ["<leader>k"] = vim.lsp.buf.signature_help,
    ["<leader>fmt"] = vim.lsp.buf.format,

    ["K"] = vim.lsp.buf.hover,
    ["gd"] = "<cmd>Telescope lsp_definitions<CR>",
    ["gD"] = "<cmd>Telescope lsp_declarations<CR>",
    ["gr"] = "<cmd>Telescope lsp_references<CR>",
    ["gi"] = "<cmd>Telescope lsp_implementations<CR>",

    ["<leader>r"] = "<cmd>Telescope lsp_document_symbols<CR>",
    ["<leader>d"] = vim.diagnostic.open_float,
    ["<leader>rn"] = vim.lsp.buf.rename,
    ["<leader>ca"] = vim.lsp.buf.code_action,
    ["<leader>."] = vim.lsp.buf.code_action,
    ["go"] = vim.diagnostic.open_float,
    ["<leader>lq"] = vim.diagnostic.setloclist,
    ["[d"] = "<cmd>lua vim.diagnostic.goto_prev({ border = \"rounded\" })<CR>",
    ["]d"] = "<cmd>lua vim.diagnostic.goto_next({ border = \"rounded\" })<CR>",
  }, bufopts)

  lsp_highlight_document(client, buffer)

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

return M
