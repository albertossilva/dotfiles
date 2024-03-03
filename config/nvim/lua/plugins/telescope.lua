return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local icons = require 'utils.icons'
    local k = require 'utils.keymaps'

    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case',
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        sorting_strategy = 'ascending',
        path_display = { 'smart' },
        prompt_prefix = icons.ui.Telescope .. ' ',
        selection_caret = icons.ui.Telescope_selection_caret,
        layout_config = {
          prompt_position = 'top',
          height = 0.9,
          width = 0.9,
        },
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<Down>'] = actions.cycle_history_next,
            ['<Up>'] = actions.cycle_history_prev,
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
          },
        },
      },
    }

    telescope.load_extension 'media_files'
    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'

    k.nmap('<leader><leader>', builtin.find_files, 'Find Files')
    k.nmap('<leader>F', '<cmd>Telescope live_grep theme=ivy<cr>', 'Live Grep')

    k.nmap('<leader>sg', builtin.git_files, '[S]earch [g]it files')
    k.nmap('<leader>sw', builtin.grep_string, '[S]earch current [w]ord')
    k.nmap('<leader>st', builtin.builtin, '[S]earch [t]elescope')
    k.nmap('<leader>sd', builtin.diagnostics, '[S]earch [d]iagnostics')
    k.nmap('<leader>sc', builtin.resume, '[S]earch [c]ontinue')
    k.nmap('<leader>sr', builtin.oldfiles, '[S]earch [r]ecent Files')
    k.nmap('<leader>sR', builtin.oldfiles, '[S]earch [R]egisters')
    k.nmap('<leader>sb', builtin.buffers, '[S]earch [b]uffers')
    k.nmap('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
    k.nmap('<leader>sh', builtin.help_tags, '[S]earch [H]elp')

    -- Slightly advanced example of overriding default behavior and theme
    k.nmap('<leader>/', function()
      local dropdown = require('telescope.themes').get_dropdown { winblend = 20, previewer = false }
      builtin.current_buffer_fuzzy_find(dropdown)
    end, '[/] Fuzzily search in current buffer')

    -- Shortcut for searching your neovim configuration files
    k.nmap('<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, '[S]earch [N]eovim files')
  end,
}
