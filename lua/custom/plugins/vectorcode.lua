return {
  'Davidyz/VectorCode',
  version = '*',
  enabled = false,
  build = 'uv tool upgrade vectorcode', -- This helps keeping the CLI up-to-date
  dependencies = { 'nvim-lua/plenary.nvim' },
}
