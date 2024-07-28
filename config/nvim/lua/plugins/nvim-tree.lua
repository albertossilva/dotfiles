return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    local nvim_tree = require 'nvim-tree'
    local icons = require 'utils.icons'
    local k = require 'utils.keymaps'

    nvim_tree.setup {
      hijack_cursor = true,
      renderer = {
        root_folder_modifier = ':t',
        icons = {
          glyphs = {
            default = icons.ui.file,
            symlink = icons.ui.symlink,
            folder = icons.folder,
            git = icons.git_files,
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = icons.diagnostics,
      },
      view = {
        adaptive_size = true,
        width = 50,
        side = 'left',
      },
    }

    k.nmap('<leader>e', '<cmd>NvimTreeToggle<cr>', 'Toggle Explorer')
    k.nmap('<leader>f', '<cmd>NvimTreeFindFile<CR>', 'Current file on Explorer')
  end,
}
