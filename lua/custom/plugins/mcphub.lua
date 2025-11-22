return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  enabled = function()
    return os.getenv 'NVIM_AI_PROVIDER' ~= nil
  end,
  build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  config = function()
    require('mcphub').setup()
  end,
}
