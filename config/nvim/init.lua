-- Setup globals that I expect to be always available.
require("utils.globals")

-- Turn off builtin plugins I do not use.
-- require "tj.disable_builtin"
require("utils.disable_builtin")

require("start.abbreviations")
require("start.autocommands")
require("start.keymaps")
require("start.options")
require("start.plugins")
