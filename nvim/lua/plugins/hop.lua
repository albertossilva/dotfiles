return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    local k = require 'utils.keymaps'
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

    k.nmap('<leader>jw', ':HopWord<cr>', '[J]ump to [w]ord')
    k.nmap('<leader>jk', ':HopWordCurrentLine<cr>', '[J]ump in [k]urrent line')
    k.nmap('<leader>jj', ':HopPattern<cr>', '[J]ump')
  end,
}
