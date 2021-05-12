-- Remap space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "

-- NvimTree
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Better newline
vim.api.nvim_set_keymap('n', 'o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })

-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { silent = true })

-- Indent doesn't reset
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Better macro fun
vim.api.nvim_set_keymap('n', '<Leader>m', '@q', { noremap = true, silent = true })

-- Clear highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':let @/=""<CR>', {silent = true})
