local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class ="ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- completion
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
    "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
    "hrsh7th/cmp-cmdline", -- completion for command line
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
    "hrsh7th/cmp-nvim-lua",

    -- nvim-cmp requires one snippet engine
    { "L3MON4D3/LuaSnip", version = "v1.*" },
    "saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
  },
  config = function()
    -- menuone: pop up even when there's only one match
    -- noinsert: Do not insert text until a selection is made
    -- noselect: Do not select, force user to select one from the menu
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      require("notify")("Cmp key is broken")
      return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
      require("notify")("Luasnip is broken")
      return
    end

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    require("luasnip/loaders/from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), { "i", "c" }),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind]
          vim_item.menu = ({
            nvim_lsp = "",
            nvim_lua = "",
            luasnip = "",
            buffer = "",
            path = "",
            emoji = "",
          })[entry.source.name]
          return vim_item
        end,
      },
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
      experimental = {
        native_menu = false,
        ghost_text = true,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
