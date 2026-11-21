local function gh(repo) return 'https://github.com/' .. repo end

-- nvim-treesitter is already added by `kickstart.plugins.treesitter`, which loads before this file
vim.pack.add {
  gh 'nvim-neotest/neotest',
  gh 'nvim-neotest/nvim-nio',
  gh 'nvim-neotest/neotest-python',
  gh 'nvim-lua/plenary.nvim',
  gh 'antoinemadec/FixCursorHold.nvim',
}

require('neotest').setup {
  adapters = {
    require('neotest-python') {
      -- Runner to use. Will use pytest if available by default.
      -- Can be a function to return dynamic value.
      runner = 'pytest',
      -- Custom python path for the runner.
      -- Can be a string or a list of strings.
      -- Can also be a function to return dynamic value.
      -- If not provided, the path will be inferred by checking for
      -- virtual envs in the local directory and for Pipenev/Poetry configs:

      -- python = ".venv/bin/python",

      -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
      -- instances for files containing a parametrize mark (default: false)
      pytest_discover_instances = true,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et