-- Python
local python_arguments = {}
local flake8 = {LintCommand = 'flake8 --ignore=E501,E252,E124,E741 --stdin-display-name ${INPUT} -', lintStdin = true}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)
table.insert(python_arguments, isort)
table.insert(python_arguments, black)

-- Lua
local lua_arguments = {}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

table.insert(lua_arguments, luaFormat)

-- Shell
local sh_arguments = {}
local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

table.insert(sh_arguments, shellcheck)

-- Rust
local rust_arguments = {}
local rustfmt = {formatCommand = 'rustfmt', formatStdin = true}

table.insert(rust_arguments, rustfmt)

-- Config
require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "lua", "python", "rust", -- "javascriptreact"
        -- "javascript",
        -- "typescript",
        -- "typescriptreact",
        "sh"
        -- "html",
        -- "css",
        -- "json",
        -- "yaml",
        -- "markdown",
        -- "vue"
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            sh = sh_arguments,
            rust = rust_arguments
            -- javascript = tsserver_args,
            -- javascriptreact = tsserver_args,
            -- typescript = tsserver_args,
            -- typescriptreact = tsserver_args,
            -- html = {prettier},
            -- css = {prettier},
            -- json = {prettier},
            -- yaml = {prettier},
            -- markdown = {markdownPandocFormat}
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            -- markdown = {markdownPandocFormat, markdownlint},
        }
    }
}

