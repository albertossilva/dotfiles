return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "nvim-telescope/telescope.nvim",
      "b0o/schemastore.nvim",
      "nvimdev/lspsaga.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = false,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local yamlSchemas = require("schemastore").yaml.schemas()
      local jsonSchemas = require("schemastore").json.schemas()

      local servers = {
        -- Linters / Formatters
        eslint_d = {},
        prettier = {},
        prettierd = {},
        stylua = {},

        -- LSPs
        cssls = {},
        html = {},
        jsonls = {
          settings = {
            json = {
              schemas = jsonSchemas,
              validate = { enable = true },
              format = { enable = true },
            },
            jsonc = {
              schemas = jsonSchemas,
              validate = { enable = true },
              format = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        rust_analyzer = {},
        ts_ls = {
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enable = false, url = "" },
              schemas = yamlSchemas,
              validate = true,
              format = { enable = true },
            },
          },
        },
      }

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
      require("lspsaga").setup({})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
          end

          local bufferMap = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to previous diagnostic")
          map("]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostic")

          map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
          bufferMap("gd", "<Cmd>Lspsaga goto_definition<CR>", "[g]oto [d]efinition")
          bufferMap("gO", require("telescope.builtin").lsp_document_symbols, "[g]et document symb[O]ls")
          bufferMap("K", "<Cmd>Lspsaga hover_doc<CR>", "Des[k]cribe Type")
          map("<Leader>.", "<Cmd>Lspsaga code_action<CR>", "Code [a]ction")
          map("<leader>ld", "<Cmd>Lspsaga show_buf_diagnostics<CR>", "Show [d]iagnostics")
          map("<leader>lF", "<Cmd>Lspsaga finder<CR>", "LSP [f]inder")
          map("<leader>lr", "<Cmd>Lspsaga rename<CR>", "[r]e[n]ame")
          map("<leader>lR", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })

            -- vim.opt.updatetime = 1000
          end

          if client.name == "ts_ls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end,
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
