return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "tpope/vim-fugitive",
  },
  version = "v0.6",
  config = function()
    -- require("gitsigns").setup {
    --   signs = {
    --     add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    --     change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    --     delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    --     topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    --     changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    --     untracked = { text = "┆" },
    --   },
    --   current_line_blame = true,
    --   current_line_blame_opts = {
    --     virt_text = true,
    --     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    --     delay = 1000,
    --     ignore_whitespace = true,
    --   },
    --   update_debounce=500,
    --   attach_to_untracked = false,
    --   max_file_length = 500,
    -- }
  end,
}
