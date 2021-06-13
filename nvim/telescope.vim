lua << EOF
require('telescope').setup{
  defaults = {
    find_command = {
      'fd',
      '--hidden',
      '--color=always',
      '--type',
      'f',
      '--exclude',
      '.git'
    },
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- prompt_position = "bottom",
    prompt_prefix = ">",
    scroll_strategy = "cycle",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    -- layout_defaults = {
    --   -- TODO add builtin options.
    -- },
    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file ,
    file_ignore_patterns = {
      '*.stack-work'
    },
    -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.4,
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
  }
}
EOF
