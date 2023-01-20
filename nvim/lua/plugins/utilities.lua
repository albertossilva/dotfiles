return {
  "rcarriga/nvim-notify",
  -- Lua Development
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  -- Development helpers
  "editorconfig/editorconfig-vim",
  "NvChad/nvim-colorizer.lua",
  -- Utilities
  {
    "lewis6991/impatient.nvim",
    config = function()
      local impatient = require("impatient")
      impatient.enable_profile()
    end
  },
  "windwp/nvim-autopairs",
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      local todoComments = require("todo-comments")
      todoComments.setup({
        sign_priority = 15, -- sign priority
        keywords = {
          FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        highlight = {
          keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
          exclude = {}, -- list of file types to exclude highlighting
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
      })
    end
  }
}

-- require('neoscroll').setup({
--     -- All these keys will be mapped to their corresponding default scrolling animation
--     mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
--                 '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
--     hide_cursor = true,          -- Hide cursor while scrolling
--     stop_eof = true,             -- Stop at <EOF> when scrolling downwards
--     respect_scrolloff = true,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
--     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
--     easing_function = nil,       -- Default easing function
--     pre_hook = nil,              -- Function to run before the scrolling animation starts
--     post_hook = nil,             -- Function to run after the scrolling animation ends
--     performance_mode = false,     -- Disable "Performance Mode" on all buffers.
-- })

-- vim.cmd("let g:indent_blankline_char_list = ['▏', '¦', '┆', '┊']")

-- vim.cmd [["highlight IndentBlanklineIndent1 guifg=#EEEEEE gui=nocombine"]]
-- return {
-- "lukas-reineke/indent-blankline.nvim",
-- disabled = true,
  -- config = function()
  --   local indent_blankline = require("indent_blankline")

  --   indent_blankline.setup {
  --     char = "▏",
  --     show_trailing_blankline_indent = false,
  --     show_first_indent_level = false,
  --     use_treesitter = true,
  --     show_current_context = true,
  --     buftype_exclude = { "terminal", "nofile" },
  --     filetype_exclude = require("utils.filetypes").non_editable_filetypes,
  --   }
  -- end
-- }

