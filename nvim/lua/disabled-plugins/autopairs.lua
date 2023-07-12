return {
  "windwp/nvim-autopairs",
  config = function()
    -- Setup nvim-cmp
    local npairs = require("nvim-autopairs")

    npairs.setup {
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
    }

    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
  end
}