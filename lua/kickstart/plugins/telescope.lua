-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Define local function that sets prefix for description
      local kmap = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = 'Telescope: ' .. desc })
      end

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      kmap('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
      kmap('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
      kmap('<leader>sf', builtin.find_files, '[S]earch [F]iles')
      kmap('<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
      kmap('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
      kmap('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
      kmap('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
      kmap('<leader>sr', builtin.resume, '[S]earch [R]esume')
      kmap('<leader>s.', builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
      kmap('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')

      -- Slightly advanced example of overriding default behavior and theme
      kmap('<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, '[/] Fuzzily search in current buffer')

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      kmap('<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, '[S]earch [/] in Open Files')

      -- Shortcut for searching your Neovim configuration files
      kmap('<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, '[S]earch [N]eovim files')

      kmap('<leader>gl', builtin.git_commits, 'Browse [G]it [L]og')
      kmap('<leader>gb', builtin.git_branches, 'List [G]it [B]ranches')
      kmap('<leader>gf', builtin.git_bcommits, 'Browse [G]it log for current [F]ile')
      kmap('<leader>gs', builtin.git_status, '[G]it [S]tatus')
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
