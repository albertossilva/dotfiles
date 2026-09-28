local function map(mode, previous, command)
  vim.keymap.set(mode, previous, command, { noremap = true, silent = true })
end

--Don not use arrow keys
map("n", "<Up>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Left>", "<NOP>")
map("n", "<Right>", "<NOP>")

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Better window navigation
map("n", "<C-H>", "<C-w>h")
map("n", "<C-J>", "<C-w>j")
map("n", "<C-K>", "<C-w>k")
map("n", "<C-L>", "<C-w>l")

--Center screen on finding / scrolling
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--Moving lines
map("n", "<C-j>", ":m .+1<CR>")
map("n", "<C-k>", ":m .-2<CR>")
map("i", "<C-j>", "<ESC>:m .+1<CR>==gi")
map("i", "<C-k>", "<ESC>:m .-2<CR>==gi")

--Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

--Better paste
map("v", "p", '"_dP')

--Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

--Line numbers
map("n", "<F7>", ":set norelativenumber<cr>")
map("n", "<F8>", ":set relativenumber<cr>")
