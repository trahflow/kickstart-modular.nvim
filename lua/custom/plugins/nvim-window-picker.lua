vim.pack.add {
  { src = 'https://github.com/s1n7ax/nvim-window-picker', version = vim.version.range '2' },
}

require('window-picker').setup {
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      -- if the buffer type is one of following, the window will be ignored
      buftype = { 'terminal', 'quickfix' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et