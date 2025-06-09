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
    opts = {},
  },
}
