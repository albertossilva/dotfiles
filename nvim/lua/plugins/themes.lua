return {
  'lunarvim/onedarker.nvim',
  'folke/tokyonight.nvim',
  'dracula/vim',
  { 'catppuccin/nvim', branch = 'main', name = 'catppuccin' },
  'lunarvim/darkplus.nvim',
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    prioriry = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
