return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
      },
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      model = "gpt-5.2", -- AI model to use
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
        width = 0.4, -- 50% of screen width
      },
    },
  },
}
