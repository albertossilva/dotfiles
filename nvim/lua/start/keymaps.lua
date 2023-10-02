--Shorten function name
local keymap = vim.keymap.set
--Silent keymap option
local opts = { noremap = true, silent = true }

--Don not use arrow keys
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Hop
--place this in one of your configuration file(s)
keymap("n", "<leader>jf", ":HopWord<cr>", opts)
keymap("n", "<leader>jk", ":HopWordCurrentLine<cr>", opts)
keymap("n", "<leader>jj", ":HopPattern<cr>", opts)

--Normal --
--Better window navigation
keymap("n", "<C-H>", "<C-w>h", opts)
keymap("n", "<C-J>", "<C-w>j", opts)
keymap("n", "<C-K>", "<C-w>k", opts)
keymap("n", "<C-L>", "<C-w>l", opts)

--Center screen on finding / scrolling
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

--Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--Moving lines
keymap("n", "<C-j>", ":m .+1<CR>", opts)
keymap("n", "<C-k>", ":m .-2<CR>", opts)
keymap("i", "<C-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<C-k>", "<ESC>:m .-2<CR>==gi", opts)

--Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--Close buffers
keymap("n", "<S-q>", ":Bdelete!<CR>", opts)

--Better paste
keymap("v", "p", '"_dP', opts)

--Visual --
--Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--Plugins --

--NvimTree
keymap("n", "<leader>re", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<F3>", ":NvimTreeFocus<CR>", opts)

--Telescope
keymap("n", "<leader><leader>", ":Telescope find_files<CR>", opts)

--Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.line(vim.fn.visualmode())<CR>')

--Line numbers
keymap("n", "<F7>", ":set norelativenumber<cr>", opts)
keymap("n", "<F8>", ":set relativenumber<cr>", opts)
