-- [[ Basic Keymaps ]]
--  See `:help kmap()`

-- Define local function that sets prefix for description
local kmap = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'Global: ' .. desc })
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
kmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights on search when pressing <Esc> in normal mode')

-- Diagnostic keymaps
kmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
kmap('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- TIP: Disable arrow keys in normal mode
-- kmap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- kmap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- kmap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- kmap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
kmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
kmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
kmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
kmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

kmap('<C-d>', '<C-d>zz', 'Scroll down and recenter cursor')
kmap('<C-u>', '<C-u>zz', 'Scroll up and recenter cursor')

-- unset some global default keymaps to avoid overlap
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Global: Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
