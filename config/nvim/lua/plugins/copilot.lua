return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
          rocks = { "tiktoken_core" },
        },
      },
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  },
}
