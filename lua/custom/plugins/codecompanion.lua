return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy', -- Lazy load for better startup performance
  -- deactivated because sidekick is used instead
  enabled = false,
  -- enable only if environment variable is set
  -- enabled = function()
  --   return os.getenv 'NVIM_AI_PROVIDER' ~= nil
  -- end,
  opts = function()
    return {
      adapters = {
        http = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-sonnet-4',
                },
              },
            })
          end,
        },
      },
      extensions = {
        vectorcode = {
          enabled = false,
        },
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- 'Davidyz/VectorCode',
  },
  keys = {
    { '<leader>aa', ':CodeCompanionActions<CR>', mode = 'n', desc = 'Codecompanion: Open Actions' },
    { '<leader>ac', ':CodeCompanionChat<CR>', mode = 'n', desc = 'Codecompanion: Chat' },
  },
}
