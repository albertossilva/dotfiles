return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "pmizio/typescript-tools.nvim",
    },
    config = function()
      -- Check if all dependencies are installed, otherwise exits early
      local dependencies = { "mason", "mason-lspconfig", "lspconfig" }
      local status_ok, deps = require("utils.prequire")(dependencies, "Failed to start LSP")
      if not status_ok then
        return
      end

      local mason, mason_lspconfig, lspconfig = unpack(deps)

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
        "lua_ls",
        "ts_ls",
        "jdtls",
        "jsonls",
        "yamlls",
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
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      local keys = {
        vsplit = "v",
        split = "x",
        shuttle = "[w",
        toggle_or_open = "o",
        jump = "e",
        tabe = "t",
        tabnew = "r",
        quit = "q",
        close = "<C-c>k",
      }
      require("lspsaga").setup({
        event = "LspAttach",
        ft = { "typescript" },
        callhierarchy = { keys = keys },
        finder = { keys = keys },
        outline = { keys = keys, close_after_jump = true },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
}
