local keymap = vim.keymap.set

local map = function (mode)
  return function(keys, func, maybe_desc)
    local desc = maybe_desc or ""
    local opts = { noremap = true, silent = true, desc = desc }
    keymap(mode, keys, func, opts)
  end
end

return {
  nmap = map("n"),
  imap = map("i"),
  vmap = map("v"),
  xmap = map("x"),
}

