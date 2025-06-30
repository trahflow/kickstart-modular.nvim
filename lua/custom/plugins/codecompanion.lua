return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy', -- Lazy load for better startup performance
  -- enable only if environment variable is set
  enabled = function()
    return os.getenv 'NVIM_AI_PROVIDER' ~= nil
  end,
  opts = {
    strategies = {
      chat = {
        adapter = 'copilot',
      },
      inline = {
        adapter = 'copilot',
      },
      agent = {
        adapter = 'copilot',
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
