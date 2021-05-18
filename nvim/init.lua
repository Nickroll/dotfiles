-- Plugin install
require('plugins')
require('globals-lua')
require('settings')
require('keymapings')
require('autocmds-lua')

-- Plugins
require('nvimtree-lua')
require('colorscheme') -- after nvimtree
require('barbar-lua')
require('gitsigns-lua')
require('colorizer-lua')
require('galaxyline-lua')
require('autopairs-lua')
require('treesitter-lua')
require('telescope-lua')
require('ts-rainbow-lua')
require('lsp-sig-lua')
require('quickscope-lua')
require('dashboard-lua')
require('lazygit-lua')
require('asyncrun-lua')

-- LSP
require('compe-lua')
require('lsp')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.bash-ls')
require('lsp.efm-ls')
require('lsp.gopls-ls')
