-- Plugin install
require('plugins')
require('globals-lua')
require('settings')
require('keymapings')

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

-- LSP
require('compe-lua')
require('lsp')
require('lsp.lua-ls')
