-- VimTeX has no branch that supports lazy-loading cleanly; `vim.pack` loads it at startup.
vim.pack.add { 'https://github.com/lervag/vimtex' }

-- VimTeX configuration goes here, e.g.
vim.g.vimtex_view_method = 'zathura'

-- vim: ts=2 sts=2 sw=2 et