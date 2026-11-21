local function gh(repo) return 'https://github.com/' .. repo end

-- neo-tree.nvim is added by `kickstart.plugins.neo-tree`, which loads before this file
vim.pack.add {
  gh 'antosha417/nvim-lsp-file-operations',
  gh 'nvim-lua/plenary.nvim',
}

require('lsp-file-operations').setup()

-- vim: ts=2 sts=2 sw=2 et