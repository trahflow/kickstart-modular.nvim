return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {}
  end,
  enabled = function()
    return os.getenv 'NVIM_AI_PROVIDER' == 'Copilot'
  end,
}
