-- clear autogroup first to prevent it running multiple times
vim.api.nvim_create_augroup("options_user_config", { clear = true })

-- autocommand to reload options.lua when saving
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "options_user_config",
  pattern = "options.lua",
  command = "source <afile>",
})

local options = {
  backup = false,                                             -- creates a backup file
  cmdheight = 1,                                              -- more space in the neovim command line for displaying messages
  conceallevel = 0,                                           -- so that `` is visible in markdown files
  fileencoding = "utf-8",                                     -- the encoding written to a file
  hlsearch = true,                                            -- highlight all matches on previous search pattern
  ignorecase = true,                                          -- ignore case in search patterns
  completeopt = { "menu", "menuone", "noinsert", "noselect" }, -- mostly just for cmp
  pumheight = 10,                                             -- pop up menu height

  showtabline = 0,                                            -- always show tabs
  smartcase = true,                                           -- smart case
  smartindent = true,                                         -- make indenting smarter again
  expandtab = true,                                           -- convert tabs to spaces
  shiftwidth = 2,                                             -- the number of spaces inserted for each indentation

  tabstop = 2,                                                -- insert 2 spaces for a tab

  -- split to right and below
  splitright = true,
  splitbelow = true,

  -- exrc = true,                             -- disable write on auto commands

  -- non visible characters mapping
  list = true,         -- show list characters
  swapfile = false,    -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500,    -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,     -- enable persistent undo
  updatetime = 300,    -- faster completion (4000ms default)
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true,   -- highlight the current line
  laststatus = 3,      -- always show
  numberwidth = 4,     -- set number column width
  signcolumn = "yes",  -- always show the sign column, otherwise it would shift the text each time
  wrap = false,        -- display lines as one long line
  showcmd = true,      -- show last command used

  -- change window title from vim
  title = true,
  titlestring = "%{expand(\"%:~:.:f\")}\\ (%{strftime('%Y-%m-%d\\ %H:%M',getftime(expand('%')))})",

  -- Minimal space to keep above and below the cursor
  scrolloff = 10,
  sidescrolloff = 10,
  guifont = "JetBrainsMono Nerd Font Mono:h16", -- the font used in graphical neovim applications
  background = "dark",

  number = true,
  relativenumber = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.o.background = "dark" -- or "light" for light mode
vim.api.nvim_command("set listchars=tab:→\\ ,lead:.,space:·,nbsp:␣,trail:•,precedes:«,extends:»")
vim.api.nvim_command("set number relativenumber")
vim.opt.fillchars.eob = " "
vim.opt.path:append("**")
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
