return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        json = { "jq" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    })
  end,
}
