vim.cmd('let bufferline = get(g:, "bufferline", {})')
vim.cmd('let bufferline.closable = v:false')

vim.api.nvim_set_keymap('n', '<Leader>p', ':BufferPick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':BufferClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
