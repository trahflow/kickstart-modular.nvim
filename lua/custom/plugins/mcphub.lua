-- mcphub: MCP server hub for AI plugins, loaded whenever an AI provider is configured.
-- The `mcp-hub` node binary is installed by the `PackChanged` handler in `lua/pack.lua`.

if os.getenv 'NVIM_AI_PROVIDER' == nil then return end

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'ravitemer/mcphub.nvim',
  gh 'nvim-lua/plenary.nvim',
}

require('mcphub').setup()

-- vim: ts=2 sts=2 sw=2 et