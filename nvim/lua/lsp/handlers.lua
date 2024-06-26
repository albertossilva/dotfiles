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
  virtual_text = false,   -- disable the annoying text on the right side of the line
  update_in_insert = true, -- check if this option makes larger codebases too slow
})

set_keymap({
  ["[d"] = "<Cmd>Lspsaga diagnostic_jump_prev<CR>",
  ["]d"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
})

local M = {}
local cmp_nvim_lsp = unpack(deps)
M.capabitilies = cmp_nvim_lsp.default_capabilities()
M.on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  set_keymap({
    ["<Leader>-k"] = vim.lsp.buf.signature_help,
    ["<Leader>o"] = "<Cmd>Lspsaga outline<CR>",
    ["<Leader>D"] = vim.lsp.buf.type_definition,
    ["<Leader>ca"] = "<Cmd>Lspsaga code_action<CR>",
    ["<Leader>."] = "<Cmd>Lspsaga code_action<CR>",
    ["<Leader>fmt"] = function()
      vim.lsp.buf.format({ async = true })
    end,
    ["<Leader>rn"] = "<Cmd>Lspsaga rename<CR>",
    ["K"] = "<Cmd>Lspsaga hover_doc<CR>",
    ["gD"] = "<Cmd>Lspsaga finder def+ref+imp<CR>",
    ["gd"] = "<Cmd>Lspsaga goto_definition<CR>",
    ["gi"] = "<Cmd>Lspsaga finder imp<CR>",
    ["gr"] = "<Cmd>Lspsaga finder ref<CR>",
  }, bufopts)

  lsp_highlight_document(client, bufnr)

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

return M
