return {
  'RRethy/vim-illuminate',
  config = function()
    local illuminate = require 'illuminate'

    local filetypes = require 'utils.filetypes'

    vim.g.Illuminate_ftblacklist = filetypes.non_editable_filetypes
    vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".goto_next_reference{wrap=true}<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".goto_prev_reference{reverse=true,wrap=true}<cr>', { noremap = true })

    illuminate.configure {
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      -- delay: delay in milliseconds
      delay = 120,
      filetypes_denylist = filetypes.non_editable_filetypes,
      -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
      filetypes_allowlist = {},
      -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
      modes_denylist = {},
      -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
      modes_allowlist = {},
      -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
      -- Only applies to the 'regex' provider
      -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
      providers_regex_syntax_denylist = {},
      -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
      -- Only applies to the 'regex' provider
      -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
      providers_regex_syntax_allowlist = {},
      -- under_cursor: whether or not to illuminate under the cursor
      under_cursor = true,
    }
  end,
}
