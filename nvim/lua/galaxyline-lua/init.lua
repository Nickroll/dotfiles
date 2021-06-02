local vim = vim
local mode = vim.fn.mode
local galaxyline = require('galaxyline')
local section = galaxyline.section

-- Formating
local function printer(str)
    return function()
        return str
    end
end

local space = printer(' ')

-- COLOR constants
local _COLORS = {
    bg = '#222433',
    bblue = '#929be5',
    grey = '#282a3a',
    lgrey = '#4b4e6d',
    red = '#dc6f79',
    tan = '#ac8b83',
    green = '#73c1a9',
    purple = '#b871b8',
    font = '#000000',
    df = '#9ea3c0'
}

-- Modes
local _MODES = {
    ['c'] = {' COMMAND', _COLORS.red},
    ['ce'] = {' NORMAL EX', _COLORS.red},
    ['cv'] = {' EX', _COLORS.red},
    ['i'] = {' INSERT', _COLORS.green},
    ['ic'] = {' INS-COMPLETE', _COLORS.green},
    ['n'] = {' NORMAL', _COLORS.purple},
    ['no'] = {' OPERATOR-PENDING', _COLORS.purple},
    ['r'] = {' HIT-ENTER', _COLORS.lgrey},
    ['r?'] = {' :CONFIRM', _COLORS.lgrey},
    ['rm'] = {' --MORE', _COLORS.lgrey},
    ['R'] = {' REPLACE', _COLORS.lgrey},
    ['Rv'] = {' VIRTUAL', _COLORS.lgrey},
    ['s'] = {' SELECT', _COLORS.lgrey},
    ['S'] = {' SELECT', _COLORS.lgrey},
    [''] = {' SELECT', _COLORS.lgrey},
    ['t'] = {' TERMINAL', _COLORS.orange},
    ['v'] = {' VISUAL', _COLORS.bblue},
    ['V'] = {' V-LINE', _COLORS.bblue},
    [''] = {' V-BLOCK', _COLORS.bblue},
    ['!'] = {' SHELL', _COLORS.tan}
}

-- Functs
local function checkwidth()
    return (vim.fn.winwidth(0) / 2) > 40
end

local function all(...)
    local args = {...}
    return function()
        for _, fn in ipairs(args) do if not fn() then return false end end
        return true
    end
end

local function find_git_root()
    return require('galaxyline/provider_vcs').get_git_dir(vim.fn.expand('%:p:h'))
end

local function get_file_icon_color()
    return require('galaxyline/provider_fileinfo').get_file_icon_color()
end

local function buffer_not_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local function lspclient()
    local tbl = {['dashboard'] = true, [' '] = true}
    if tbl[vim.bo.filetype] then return false end
    return true
end

-- Don't display on
galaxyline.short_line_list = {'NvimTree', 'packer'}

-- Sections
section.left = {
    {
        ViMode = {
            provider = function() -- auto change color according the vim mode
                local mode_color = nil
                local mode_name = nil

                if vim.g.libmodalActiveModeName then
                    mode_name = vim.g.libmodalActiveModeName
                    mode_color = _MODES[mode_name]
                else
                    local current_mode = _MODES[mode(true)] or _MODES[mode(false)]

                    mode_name = current_mode[1]
                    mode_color = current_mode[2]
                end
		vim.api.nvim_command('hi GalaxyViMode guifg='.._COLORS.font..', guibg='..mode_color)
                --require('highlite').highlight('GalaxyViMode', {fg = _COLORS.font, bg = mode_color, style = 'bold'})
                return ' ' .. mode_name .. ' '
            end
        }
    }, {FileIcon = {provider = {space, space, 'FileIcon'}, highlight = {get_file_icon_color, _COLORS.grey, 'bold'}}}, {
        FileName = {
            provider = {space, 'FileName'},
            condition = buffer_not_empty,
            highlight = {_COLORS.df, _COLORS.grey, 'bold'}
        }
    }, {
        GitBranch = {
            provider = 'GitBranch',
            icon = '   ',
            condition = find_git_root,
            highlight = {_COLORS.df, _COLORS.grey, 'bold'}
        }
    }, {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = all(checkwidth, find_git_root),
            icon = '  +',
            highlight = {_COLORS.green, _COLORS.grey, 'bold'}
        }
    }, {
        DiffModified = {
            provider = 'DiffModified',
            condition = checkwidth,
            icon = '~',
            highlight = {_COLORS.tan, _COLORS.grey, 'bold'}
        }
    }, {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = checkwidth,
            icon = '-',
            highlight = {_COLORS.red, _COLORS.grey, 'bold'}
        }
    }
}
section.right = {
    {
        ShowLspClient = {
            provider = 'GetLspClient',
            condition = lspclient,
            icon = '  ',
            highlight = {_COLORS.tan, _COLORS.grey, 'bold'}
        }
    }, {FileFormat = {provider = {space, space, 'FileEncode', space}, highlight = {_COLORS.df, _COLORS.grey, 'bold'}}},
    {FileType = {provider = {'FileTypeName', space}, highlight = {_COLORS.df, _COLORS.grey, 'bold'}}}, {
        LineNumber = {
            provider = {
                function()
                    return vim.fn.line('.')
                end
            },
            icon = '  ',
            condition = buffer_not_empty,
            highlight = {_COLORS.df, _COLORS.grey, 'bold'}
        }
    }, {EmptySpace = {provider = space, highlight = {_COLORS.df, _COLORS.grey, 'bold'}}}
}

-- Shortline
section.short_line_left = {
    {BufferType = {provider = {space, space, 'FileTypeName', space}, highlight = {_COLORS.df, _COLORS.grey, 'bold'}}}
}
section.short_line_right = {{BufferIcon = {provider = 'BufferIcon', highlight = {_COLORS.df, _COLORS.grey, 'bold'}}}}
