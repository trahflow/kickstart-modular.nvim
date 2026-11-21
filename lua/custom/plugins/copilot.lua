-- Copilot: inline completions, only when explicitly selected via `NVIM_AI_PROVIDER`.

if os.getenv 'NVIM_AI_PROVIDER' ~= 'Copilot' then return end

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'zbirenbaum/copilot.lua',
  gh 'copilotlsp-nvim/copilot-lsp', -- next edit suggestion (NES) support
}

require('copilot').setup {}

-- vim: ts=2 sts=2 sw=2 et