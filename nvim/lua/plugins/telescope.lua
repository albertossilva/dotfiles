return {
  {
    "junegunn/fzf.vim",
    dependencies = {
      { "junegunn/fzf", build = ":call fzf#install()" },
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local icons = require("utils.icons")

      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case",
          },
        },
        defaults = {
          sorting_strategy = "ascending",
          file_ignore_patterns = { "node_modules", "build", "dist", "artifacts", "package-lock.json" },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "smart" },
          prompt_prefix = icons.ui.Telescope .. " ",
          selection_caret = icons.ui.Telescope_selection_caret,
          layout_config = {
            prompt_position = "top",
            height = 0.9,
            width = 0.9,
            vertical = {
              mirror = false,
            },
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<Down>"] = actions.cycle_history_next,
              ["<Up>"] = actions.cycle_history_prev,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
        },
      })

      telescope.load_extension("media_files")
      telescope.load_extension("fzf")
    end,
  },
}
