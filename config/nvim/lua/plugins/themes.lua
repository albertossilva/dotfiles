return {
  "folke/tokyonight.nvim",
  "dracula/vim",
  { "catppuccin/nvim", branch = "main", name = "catppuccin" },
  "lunarvim/darkplus.nvim",
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  "xiyaowong/transparent.nvim",
}
