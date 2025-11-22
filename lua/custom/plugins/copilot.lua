return {
  'zbirenbaum/copilot.lua',
  requires = {
    'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
  },
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {}
  end,
  enabled = function()
    return os.getenv 'NVIM_AI_PROVIDER' == 'Copilot'
  end,
}
