O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'dogrun',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'zsh',
	timeoutlen = 1000,

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = "!"}, signs = true, underline = false}
    },
    python = {
        autoformat = true,
        isort = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = "!"}, signs = true, underline = false},
		analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
   sh = {
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = "!"}, signs = true, underline = false}
    },

}
--
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
