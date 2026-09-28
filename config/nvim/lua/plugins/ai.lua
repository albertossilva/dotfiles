return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
      },
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      model = "gpt-5.5",
      window = {
        layout = "vertical",
        width = 0.4,
      }
    },
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup()
    end,
  },
}
