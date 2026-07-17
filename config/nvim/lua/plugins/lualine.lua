return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width,
    }

    local filename = { "filename", path = 1 }

    local filetype = {
      "filetype",
      icons_enabled = true,
      colored = true, -- Displays filetype icon in color if set to true
      icon = { align = "left" },
    }

    local location = { "location", padding = 1 }

    local spaces = function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    local filetypes = require("utils.filetypes")

    lualine.setup({
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "gruvbox-material",
        component_separators = { left = "", right = "⎹" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = filetypes.non_editable_filetypes,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diagnostics },
        lualine_c = { filename },
        lualine_x = { diff, spaces, filetype },
        lualine_y = { location },
        lualine_z = { "progress" },
      },
    })
  end,
}
