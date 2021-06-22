local vim = vim
local api = vim.api

local auto_formatters = {}

local python_autoformat = {'BufWritePre', '*.py', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, python_autoformat)

local lua_format = {'BufWritePre', '*.lua', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, lua_format)

function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            -- if type(def) == 'table' and type(def[#def]) == 'function' then
            -- 	def[#def] = lua_callback(def[#def])
            -- end
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

nvim_create_augroups({
    _general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'},
        {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'VimLeavePre', '*', 'set title set titleold='},
        {'ColorScheme', '*', 'highlight QuickScopePrimary guifg=\'#9A5151\''},
        {'ColorScheme', '*', 'highlight QuickScopeSecondary guifg=\'#dba99e\''}
    },
    _auto_formatters = auto_formatters,
    _markdown = {{'FileType', 'markdown', 'setlocal wrap'}, {'FileType', 'markdown', 'setlocal spell'}},
    _dashboard = {
        -- seems to be nobuflisted that makes my stuff disapear will do more testing
        {
            'FileType', 'dashboard',
            'setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= '
        }, {'FileType', 'dashboard', 'set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2'}
    },
    _buffer_bindings = {
        {'FileType', 'dashboard', 'nnoremap <silent> <buffer> q :q<CR>'},
        {'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
        {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'}
    },
    _python = {{'FileType', 'python', 'nnoremap <Leader>y :AsyncRun -raw python %<CR>'}},
    _rust = {
        {'FileType', 'rust', 'nnoremap <Leader>y :AsyncRun cargo check<CR>'},
        {'FileType', 'rust', 'nnoremap <Leader>yb :AsyncRun cargo run %<CR>'}
    }
})
