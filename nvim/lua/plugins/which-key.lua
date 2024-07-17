return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    { "echasnovski/mini.nvim",  version = "*" },
    { "echasnovski/mini.icons", version = "*" },
  },
  config = function()
    local which_key = require("which-key")
    local setup = {
      preset = "classic",
      win = {
        border = "rounded",
        wo = {
          winblend = 0,
        },
      },
      layout = {
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      delay = function(ctx)
        return ctx.plugin and 0 or 10
      end,
    }
    --     g = {
    --       name = "Git",
    --       -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    --       j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    --       k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    --       l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    --       p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    --       r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    --       R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    --       s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    --       u = {
    --         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    --         "Undo Stage Hunk",
    --       },
    --       o = { "<cmd>Telescope git_status<cr>", "Open git status" },
    --       b = { "<cmd>Telescope git_branches<cr>", "Switch to branch" },
    --       c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    --       d = {
    --         "<cmd>Gitsigns diffthis HEAD<cr>",
    --         "Diff",
    --       },
    --     },
    --
    --     l = {
    --       name = "LSP",
    --       a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    --       d = {
    --         "<cmd>Telescope diagnostics<cr>",
    --         "Document Diagnostics",
    --       },
    --       w = {
    --         "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    --         "Workspace Diagnostics",
    --       },
    --       f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    --       i = { "<cmd>LspInfo<cr>", "Info" },
    --       I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    --       j = {
    --         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
    --         "Next Diagnostic",
    --       },
    --       k = {
    --         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
    --         "Prev Diagnostic",
    --       },
    --       l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    --       q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    --       r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    --       s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    --       S = {
    --         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --         "Workspace Symbols",
    --       },
    --     },
    which_key.setup(setup)
    which_key.add({
      { "<leader><leader>", "<cmd>Telescope find_files<cr>",          desc = "Find Files" },
      { "<leader>e",        "<cmd>NvimTreeToggle<cr>",                desc = "Explorer" },
      { "<leader>w",        "<cmd>w!<CR>",                            desc = "Save" },
      { "<leader>c",        "<cmd>bdelete!<CR>",                      desc = "Close Buffer" },
      { "<leader>b",        "<cmd>Telescope buffers<cr>",             desc = "Buffers" },
      { "<leader>F",        "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
      {
        "<leader>/",
        "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
        desc = "Toggle Comment",
      },
      {
        "<leader>n",
        "<cmd>lua require('illuminate').goto_next_reference({ wrap=true })<cr>",
        desc = "Next occurence",
      },
      {
        "<leader>p",
        "<cmd>lua require('illuminate').goto_prev_reference({ wrap=true })<cr>",
        desc = "Previous occurence",
      },
      { "<leader>j",  group = "Hop" },
      { "<leader>jw", "<cmd>HopWord<cr>",                          desc = "To word" },
      { "<leader>jk", "<cmd>HopWordCurrentLine<cr>",               desc = "Same line" },
      { "<leader>jj", "<cmd>HopPattern<cr>",                       desc = "By pattern" },

      -- Finders
      { "<leader>f",  group = "Find" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",             desc = "Find files" },
      { "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files (include hidden)" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                desc = "Key maps" },
      { "<leader>fc", "<cmd>Telescope colorscheme<cr>",            desc = "Colorscheme" },
      { "<leader>ft", "<cmd>Telescope<cr>",                        desc = "Telescope" },
      -- Searching
      { "<leader>s",  group = "Search" },
      { "<leader>sg", "<cmd>Telescope git_files<cr>",              desc = "Git Files" },
      { "<leader>sB", "<cmd>Telescope buffers<cr>",                desc = "Buffers" },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>",           desc = "Checkout branch" },
      { "<leader>sc", "<cmd>Telescope colorscheme<cr>",            desc = "Colorscheme" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",              desc = "Find Help" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",              desc = "Man Pages" },
      { "<leader>sr", "<cmd>Telescope oldfiles<cr>",               desc = "Open Recent File" },
      { "<leader>sR", "<cmd>Telescope registers<cr>",              desc = "Registers" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",                desc = "Keymaps" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",               desc = "Commands" },
      { "<leader>si", "<cmd>Lspsaga incoming_calls<cr>",           desc = "Incoming Calls" },
      -- Lazy Plugin Manager
      { "<leader>z",  group = "Lazy" },
      { "<leader>zz", "<cmd>Lazy home<cr>",                        desc = "Lazy" },
      { "<leader>zc", "<cmd>Lazy check<cr>",                       desc = "Check" },
      { "<leader>zi", "<cmd>Lazy install<cr>",                     desc = "Install" },
      { "<leader>zs", "<cmd>Lazy sync<cr>",                        desc = "Sync" },
      { "<leader>zu", "<cmd>Lazy update<cr>",                      desc = "Update" },
    })
    --   which_key.register(mappings, opts)
  end,
}
