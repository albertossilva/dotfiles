local dependencies = { "cmp_nvim_lsp" }
local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start lsp.handlers")
if not status_ok then
  return
end

local function k(keymap, action, desc, buffer)
  local opts = { noremap = true, silent = true, buffer = buffer, desc = desc }
  vim.keymap.set("n", keymap, action, opts)
end

local function set_keymap(keymaps, opts)
  opts = opts or { noremap = true, silent = true }
  for keymap, value in pairs(keymaps) do
    local keymapOpts = vim.tbl_deep_extend("force", opts, { desc = value.desc })

    vim.keymap.set("n", keymap, value.command, keymapOpts)
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
  virtual_text = false, -- disable the annoying text on the right side of the line
  update_in_insert = true, -- check if this option makes larger codebases too slow
})

set_keymap({
  ["[d"] = { command = "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to previous diagnostic" },
  ["]d"] = { command = "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic" },
})

local M = {}
local cmp_nvim_lsp = unpack(deps)
M.capabitilies = cmp_nvim_lsp.default_capabilities()
M.on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  k("<Leader>.", "<Cmd>Lspsaga code_action<CR>", "Code Action", bufnr)
  k("<Leader>o", "<Cmd>Lspsaga outline<CR>", "Outline", bufnr)
  set_keymap({
    ["<leader>lh"] = { command = "<Cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
    ["<Leader>rn"] = { command = "<Cmd>Lspsaga rename<CR>", desc = "Rename" },
    ["K"] = { command = "<Cmd>Lspsaga hover_doc<CR>", desc = "Describe type" },
    ["gD"] = { command = "<Cmd>Lspsaga finder def+ref+imp<CR>", desc = "Find any reference" },
    ["gd"] = { command = "<Cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
    ["gi"] = { command = "<Cmd>Lspsaga finder imp<CR>", desc = "Find implemenations" },
    ["gI"] = { command = "<Cmd>Lspsaga incoming_calls<CR>", desc = "Find Incoming calls" },
    ["gr"] = { command = "<Cmd>Lspsaga finder ref<CR>", desc = "Find references" },
  }, bufopts)

  lsp_highlight_document(client, bufnr)

  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

return M
