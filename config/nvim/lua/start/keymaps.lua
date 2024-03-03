local k = require('utils.keymaps')

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Don not use arrow keys
k.nmap("<Up>", "<NOP>", "Disable navigate with up key")
k.nmap("<Down>", "<NOP>", "Disable navigate with down key")
k.nmap("<Left>", "<NOP>", "Disable navigate with left key")
k.nmap("<Right>", "<NOP>", "Disable navigate with right key")

--Normal --
--Better window navigation
k.nmap("<C-H>", "<C-w>h")
k.nmap("<C-J>", "<C-w>j")
k.nmap("<C-K>", "<C-w>k")
k.nmap("<C-L>", "<C-w>l")

--Center screen on finding / scrolling
k.nmap("n", "nzz")
k.nmap("N", "Nzz")
k.nmap("<C-d>", "<C-d>zz")
k.nmap("<C-u>", "<C-u>zz")

--Resize with arrows
k.nmap("<C-Up>", ":resize -2<CR>")
k.nmap("<C-Down>", ":resize +2<CR>")
k.nmap("<C-Left>", ":vertical resize -2<CR>")
k.nmap("<C-Right>", ":vertical resize +2<CR>")

--Moving lines
k.nmap("<C-j>", ":m .+1<CR>")
k.nmap("<C-k>", ":m .-2<CR>")
k.imap("<C-j>", "<ESC>:m .+1<CR>==gi")
k.imap("<C-k>", "<ESC>:m .-2<CR>==gi")

-- Navigate buffers
k.nmap("<S-l>", ":bnext<CR>")
k.nmap("<S-h>", ":bprevious<CR>")

--Better paste
k.vmap("p", '"_dP')

--Visual --
--Stay in indent mode
k.vmap("v", "<", "<gv")
k.vmap("v", ">", ">gv")

--Line numbers
k.nmap("<F7>", ":set norelativenumber<cr>")
k.nmap("<F8>", ":set relativenumber<cr>")
