vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
vim.api.nvim_command("set nofoldenable")

-- vim.api.nvim_command("autocmd FileType typescript setlocal foldmethod=expr")
--[[ vim.api.nvim_command("autocmd FileType typescript setlocal foldexpr=TSFolds()") ]]
--[[]]
--[[ vim.api.nvim_command([[ ]]
--[[   function! TSFolds() ]]
--[[     let thisline = getline(v:lnum) ]]
--[[     if thisline =~? '\v^\s*$' ]]
--[[       return '-1' ]]
--[[     endif ]]
--[[]]
--[[     if thisline =~ '^import.*$' ]]
--[[       return 1 ]]
--[[     else ]]
--[[       return indent(v:lnum) / &shiftwidth ]]
--[[     endif ]]
--[[   endfunction ]]
--[[ ]]--) ]]

