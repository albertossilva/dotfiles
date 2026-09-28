-- Setup globals that I expect to be always available.
require("utils.globals")

-- Turn off builtin plugins I do not use.
require("utils.disable_builtin")

-- Initialization tweaks
require("init.abbreviations")
require("init.keymaps")
require("init.options")
require("init.autocmds")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
