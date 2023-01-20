return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "thin", -- "slant" | "thick" | "thin"
        show_duplicate_prefix = true,
        diagnostics = "nvim_lsp",
        numbers = function(opts)
          return string.format("%s", opts.ordinal)
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        }
      },
    })

    -- bufferline keybindings
    local keymap = function(key, command)
      vim.api.nvim_set_keymap("n", key, command, { noremap = true })
    end
    keymap("[b", "<Cmd>BufferLineCyclePrev<CR>")
    keymap("]b", "<Cmd>BufferLineCycleNext<CR>")
    keymap("[<Tab>", "<Cmd>b#<CR>")
    keymap("]<Tab>", "<Cmd>b#<CR>")
    keymap("gb", "<Cmd>BufferLinePick<CR>")
    keymap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
    keymap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
    keymap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
    keymap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
    keymap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
    keymap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
    keymap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
    keymap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
    keymap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
    keymap("<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>")

  end,
}

