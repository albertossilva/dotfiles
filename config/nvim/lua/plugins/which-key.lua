return {
  {
    "RRethy/vim-illuminate",
    config = function()
      local illuminate = require("illuminate")

      local filetypes = require("utils.filetypes")

      vim.g.Illuminate_ftblacklist = filetypes.non_editable_filetypes

      illuminate.configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        -- delay: delay in milliseconds
        delay = 120,
        filetypes_denylist = filetypes.non_editable_filetypes,
        -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      { "echasnovski/mini.nvim", version = "*" },
      { "echasnovski/mini.icons", version = "*" },
      { "nvim-pack/nvim-spectre" },
    },
    config = function()
      local wk = require("which-key")
      local icons = require("utils.icons")

      local rules = {
        { plugin = "fzf-lua", cat = "filetype", name = "fzf" },
        { plugin = "neo-tree.nvim", cat = "filetype", name = "neo-tree" },
        { plugin = "octo.nvim", cat = "filetype", name = "git" },
        { plugin = "yanky.nvim", icon = "󰅇", color = "yellow" },
        { plugin = "zen-mode.nvim", icon = "󱅻 ", color = "cyan" },
        { plugin = "telescope.nvim", pattern = "telescope", icon = "", color = "yellow" },
        { plugin = "trouble.nvim", cat = "filetype", name = "trouble" },
        { plugin = "todo-comments.nvim", cat = "file", name = "TODO" },
        { plugin = "nvim-spectre", icon = "󰛔 ", color = "blue" },
        { plugin = "noice.nvim", pattern = "noice", icon = "󰈸", color = "orange" },
        { plugin = "persistence.nvim", icon = " ", color = "azure" },
        { plugin = "neotest", cat = "filetype", name = "neotest-summary" },
        { plugin = "lazy.nvim", cat = "filetype", name = "lazy" },
        { plugin = "CopilotChat.nvim", icon = " ", color = "orange" },
        { pattern = "lsp", icon = " ", color = "purple" },
        { pattern = "swap next", icon = icons.swapRight, color = "yellow" },
        { pattern = "swap previous", icon = icons.swapLeft, color = "yellow" },
        { pattern = "close buffer", icon = " ", color = "red" },
        { pattern = "%f[%a]git", cat = "filetype", name = "git" },
        { pattern = "terminal", icon = " ", color = "red" },
        { pattern = "find", icon = " ", color = "green" },
        { pattern = "replace", icon = "󰛔 ", color = "orange" },
        { pattern = "search", icon = " ", color = "green" },
        { pattern = "test", cat = "filetype", name = "neotest-summary" },
        { pattern = "lazy", cat = "filetype", name = "lazy" },
        { pattern = "buffer", icon = "󰈔", color = "cyan" },
        { pattern = "file", icon = "󰈔", color = "cyan" },
        { pattern = "window", icon = " ", color = "blue" },
        { pattern = "diagnostic", icon = "󱖫 ", color = "green" },
        { pattern = "format", icon = " ", color = "cyan" },
        { pattern = "debug", icon = "󰃤 ", color = "red" },
        { pattern = "code", icon = " ", color = "orange" },
        { pattern = "notif", icon = "󰵅 ", color = "blue" },
        { pattern = "toggle", icon = " ", color = "yellow" },
        { pattern = "session", icon = " ", color = "azure" },
        { pattern = "exit", icon = "󰈆 ", color = "red" },
        { pattern = "quit", icon = "󰈆 ", color = "red" },
        { pattern = "tab", icon = "󰓩 ", color = "purple" },
        { pattern = "ai", icon = " ", color = "green" },
        { pattern = "ui", icon = "󰙵 ", color = "cyan" },
      }

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
        --- Available sorters:
        --- * local: buffer-local mappings first
        --- * order: order of the items (Used by plugins like marks / registers)
        --- * group: groups last
        --- * alphanum: alpha-numerical first
        --- * mod: special modifier keys last
        --- * manual: the order the mappings were added
        --- * case: lower-case first
        sort = { "local", "order", "group", "alphanum" },
        delay = function(ctx)
          return ctx.plugin and 0 or 10
        end,
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
          ellipsis = "…",
          mappings = true,
          rules = rules,
          colors = true,
          keys = {
            Up = "",
            Down = "",
            Left = "",
            Right = "",
            C = "󰘴",
            M = "󰘵",
            D = "󰘳",
            S = "󰘶",
            CR = "󰌑",
            Esc = "󱊷",
            ScrollWheelDown = "󱕐",
            ScrollWheelUp = "󱕑",
            NL = "󰌑",
            BS = "󰁮",
            Space = "󱁐",
            Tab = "󰌒",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
          },
        },
        show_help = true,
        show_keys = true,
        disable = {
          ft = {},
          bt = {},
        },
        debug = false,
      }

      -- color: azure, blue, cyan, green, grey, orange, purple, red, yellow
      local i = function(icon, color)
        return {
          color = color or "blue",
          icon = icon,
          cat = "filetype",
          hl = "WhichKeyIcon",
        }
      end

      local k = function(key, command, desc, icon, mode)
        if icon ~= nil then
          return {
            "<leader>" .. key,
            command,
            desc = desc,
            icon = icon,
            mode = mode or "n",
          }
        end

        return {
          "<leader>" .. key,
          command,
          desc = desc,
          mode = mode or "n",
        }
      end

      local illuminate = require("illuminate")
      local function next_reference()
        illuminate.goto_next_reference({ wrap = true })
      end
      local function prev_reference()
        illuminate.goto_prev_reference({ wrap = true })
      end

      wk.setup(setup)
      wk.add({
        k("<leader>", "<cmd>Telescope find_files<cr>", "Find Files", i("󰱼", "purple")),
        -- letters
        k("b", "<cmd>Telescope buffers<cr>", "Buffers"),
        k("c", "<cmd>bdelete<CR>", "Close Buffer"),
        k("e", "<cmd>NvimTreeToggle<cr>", "Explorer", i(icons.explorer, "yellow")),
        k("F", "<cmd>Telescope live_grep theme=ivy<cr>", "Find (live grep)", i("󱪦", "purple")),
        k("k", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy and go", i("󱎸", "green")),
        k("n", "Next occurence", next_reference, i(icons.swapRight)),
        k("p", prev_reference, "Previous occurence", i(icons.swapLeft)),
        k("w", "<cmd>w!<CR>", "Save", i(icons.save, "orange")),
        k("/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Toggle Comment"),

        -- Hiding not wanted stuff
        { "<leader>-", hidden = true },
        { "<leader>fmt", hidden = true },
        { "<leader>r", hidden = true },
        --Hop to
        { "<leader>j", group = "Hop", icon = i("󰞁") },
        k("jw", "<cmd>HopWord<cr>", "To word", i("󱀾", "yellow")),
        k("jk", "<cmd>HopWordCurrentLine<cr>", "Same line", i("", "yellow")),
        k("jj", "<cmd>HopPattern<cr>", "By pattern", i("󱩀")),

        -- Finders
        { "<leader>f", group = "Finders" },
        k("fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", "Colorscheme", i("", "red")),
        k("ff", "<cmd>Telescope find_files hidden=true<cr>", "Find files (include hidden)", i("󰱼", "cyan")),
        k("fg", "<cmd>Telescope git_files<cr>", "Git Files"),
        k("fk", "<cmd>Telescope keymaps<cr>", "Key maps", i("󰌌", "green")),
        k("ft", "<cmd>Telescope<cr>", "Telescope"),
        k("fr", "<cmd>Telescope oldfiles<cr>", "Open Recent File", i("󰔠", "orange")),
        k("fs", "<cmd>Telescope commands<cr>", "Commands", i("", "azure")),

        -- Git
        { "<leader>g", group = "Git" },
        k("gb", "<cmd>Telescope git_branches<cr>", "Switch to branch", i("")),
        k("gc", "<cmd>Telescope git_commits<cr>", "Checkout commit", i("󰜘", "yellow")),
        k("gd", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", i("", "red")),
        k("gg", "<cmd>Neogit<cr>", "Neogit"),
        k("gj", "<cmd>Gitsigns next_hunk<cr>", "Next Hunk", i("󰮰", "orange")),
        k("gk", "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk", i("󰮲", "orange")),
        k("gl", "<cmd>Gitsigns blame_line<cr>", "Blame Line", i("󱅧", "red")),
        k("gR", "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer", i("󰣜", "purple")),
        k("gs", "<cmd>Telescope git_status<cr>", "Open git status", i("󱖫", "green")),

        -- LSP
        { "<leader>l", group = "LSP" },
        k("lf", function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end, "Format"),
        k("li", "<cmd>LspInfo<cr>", "Info", i("", "yellow")),

        -- Lazy Plugin Manager
        { "<leader>p", group = "Plugins (Lazy)" },
        k("pp", "<cmd>Lazy home<cr>", "Lazy [P]lugin Manager"),
        k("pc", "<cmd>Lazy check<cr>", "Check"),
        k("pi", "<cmd>Lazy install<cr>", "Install"),
        k("ps", "<cmd>Lazy sync<cr>", "Sync"),
        k("pu", "<cmd>Lazy update<cr>", "Update"),

        -- Spectre Search/replace
        { "<leader>s", group = "Search/Replace" },
        k("sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file"),
        k("ss", '<cmd>lua require("spectre").toggle()<CR>', "Search/replace", i("󰛔", "orange")),
        k("sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Select current word"),

        -- Copilot
        { "<leader>z", group = "Copilot", icon = i("", "yellow") },
        k("zc", "<cmd>CopilotChat<cr>", "Copilot Chat", i("", "orange")),
        k("ze", "<cmd>CopilotChatExplain<cr>", "Explain", i("", "orange"), "v"),
      })
    end,
  },
}
