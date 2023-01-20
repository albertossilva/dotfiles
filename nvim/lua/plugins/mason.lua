return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- Check if all dependencies are installed, otherwise exits early
    local dependencies = { "mason", "mason-lspconfig", "lspconfig", "mason-null-ls" }
    local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start LSP")
    if not status_ok then
      return
    end

    local mason, mason_lspconfig, lspconfig, mason_null_ls = unpack(deps)

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local servers = {
      "cssls",
      "html",
      "jsonls",
      "rust_analyzer",
      "sumneko_lua",
      "tsserver",
      "jdtls",
      "kotlin_language_server",
      "gopls",
    }

    mason_lspconfig.setup({ ensure_installed = servers })

    local handlers = require("lsp.handlers")
    for _, server in ipairs(servers) do
      local settings = {
        capabitilies = handlers.capabitilies,
        on_attach = handlers.on_attach,
      }

      local settings_ok, server_settings = pcall(require, "lsp.settings." .. server)
      if settings_ok then
        settings = vim.tbl_deep_extend("force", server_settings, settings)
      end

      lspconfig[server].setup(settings)
    end

    -- plug mason_null_ls to auto install linters
    mason_null_ls.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "cspell",
        "ktlint",
        "refactoring",
        "golangci_lint",
        "goimports_reviser"
      },
    })

    -- then, setup null_ls
    require("lsp.null-ls")
  end,
}
