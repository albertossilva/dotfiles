return {
  'folke/which-key.nvim',
  config = function()
    local which_key = require 'which-key'
    local icons = require 'utils.icons'

    local setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on ' in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      icons = icons.which_key,
      popup_mappings = {
        scroll_down = '<c-j>', -- binding to scroll down inside the popup
        scroll_up = '<c-k>', -- binding to scroll up inside the popup
      },
      window = {
        border = 'single', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
      },
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = 'auto', -- automatically setup triggers
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'k' },
        v = { 'j', 'k' },
      },
    }

    local opts = {
      mode = 'n', -- NORMAL mode
      prefix = '<leader>',
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    -- local mappings = {
    --   ['w'] = { '<cmd>w!<CR>', 'Save' },
    --   ['c'] = { '<cmd>bdelete!<CR>', 'Close Buffer' },
    --   ['n'] = { '<cmd>lua require(\'illuminate\').goto_next_reference({ wrap=true })<cr>', 'Next occurence' },
    --   ['p'] = { '<cmd>lua require(\'illuminate\').goto_next_reference({ reverse=true, wrap=true })<cr>', 'Previous occurence' },
    --
    --   z = {
    --     name = 'Lazy',
    --     z = { '<cmd>Lazy home<cr>', 'Lazy' },
    --     c = { '<cmd>Lazy check<cr>', 'Check' },
    --     i = { '<cmd>Lazy install<cr>', 'Install' },
    --     s = { '<cmd>Lazy sync<cr>', 'Sync' },
    --     u = { '<cmd>Lazy update<cr>', 'Update' },
    --   },
    --
    --   g = {
    --     name = 'Git',
    --     -- g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
    --     j = { '<cmd>lua require 'gitsigns'.next_hunk()<cr>', 'Next Hunk' },
    --     k = { '<cmd>lua require 'gitsigns'.prev_hunk()<cr>', 'Prev Hunk' },
    --     l = { '<cmd>lua require 'gitsigns'.blame_line()<cr>', 'Blame' },
    --     p = { '<cmd>lua require 'gitsigns'.preview_hunk()<cr>', 'Preview Hunk' },
    --     r = { '<cmd>lua require 'gitsigns'.reset_hunk()<cr>', 'Reset Hunk' },
    --     R = { '<cmd>lua require 'gitsigns'.reset_buffer()<cr>', 'Reset Buffer' },
    --     s = { '<cmd>lua require 'gitsigns'.stage_hunk()<cr>', 'Stage Hunk' },
    --     u = {
    --       '<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>',
    --       'Undo Stage Hunk',
    --     },
    --     o = { '<cmd>Telescope git_status<cr>', 'Open git status' },
    --     b = { '<cmd>Telescope git_branches<cr>', 'Switch to branch' },
    --     c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
    --     d = {
    --       '<cmd>Gitsigns diffthis HEAD<cr>',
    --       'Diff',
    --     },
    --   },
    --
    --   l = {
    --     name = 'LSP',
    --     a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
    --     d = {
    --       '<cmd>Telescope diagnostics<cr>',
    --       'Document Diagnostics',
    --     },
    --     w = {
    --       '<cmd>Telescope lsp_workspace_diagnostics<cr>',
    --       'Workspace Diagnostics',
    --     },
    --     f = { '<cmd>lua vim.lsp.buf.format{async=true}<cr>', 'Format' },
    --     i = { '<cmd>LspInfo<cr>', 'Info' },
    --     I = { '<cmd>LspInstallInfo<cr>', 'Installer Info' },
    --     l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
    --     q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Quickfix' },
    --     r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    --     s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
    --     S = {
    --       '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
    --       'Workspace Symbols',
    --     },
    --   },
    -- }

    which_key.setup(setup)
    which_key.register({
      ['c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      -- ['d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['j'] = { name = '[J]ump', _ = 'which_key_ignore' },
      -- ['r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      -- ['w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }, opts)
  end,
}
