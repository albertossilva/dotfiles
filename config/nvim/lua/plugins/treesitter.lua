return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "styled-components/vim-styled-components",
  },
  config = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))

    require("ts_context_commentstring").setup({
      enable_autocmd = false,
      languages = {
        typescript = "// %s",
      },
    })
    require("nvim-treesitter.configs").setup({
      ignore_install = {},
      modules = {},
      sync_install = true,
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "haskell",
        "html",
        "javascript",
        "java",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "yuck",
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "css" }, -- list of language that will be disabled
      },
      auto_install = false,
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python" } },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },

        smart_rename = {
          enable = true,
          keymaps = {
            -- mapping to rename reference under cursor
            smart_rename = "grr",
          },
        },

        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
            list_definitions = "gnD", -- mapping to list all definitions in current file
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
