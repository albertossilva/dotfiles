return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- completion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- nvim-cmp requires one snippet engine
    { 'L3MON4D3/LuaSnip', version = 'v1.*' },
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    -- ensure cmp and luasnip exists
    local dependencies = { 'cmp', 'luasnip' }
    local status_ok, deps = require 'utils.prequire'(dependencies, 'Failed to start cmp.lua')
    if not status_ok then
      return
    end

    local cmp, luasnip = unpack(deps)
    local icons = require 'utils.icons'
    local item_menu = {
      buffer = '[Buffer]',
      luasnip = '[LuaSnip]',
      nvim_lsp = '[LSP]',
      nvim_lua = '[nvim_lua]',
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          -- Concatenates the icons with the name of the item kind
          vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind], vim_item.kind)
          -- Source
          vim_item.menu = item_menu[entry.source.name]
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert {
        -- also testing ergonomics for k j item navigation
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      experimental = {
        ghost_text = false,
      },
    }

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
        { name = 'path' },
      },
    })
  end,
}
