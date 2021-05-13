vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.cmd('syntax on') -- syntax highlighting
vim.cmd('set colorcolumn=100') -- fix indentline for now
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.cmd( -- fixes slow startup
    "let g:clipboard = {'copy': { '+': 'xclip -quiet -i -selection clipboard', '*': 'xclip -quiet -i -selection primary'}, 'paste': {'+': 'xclip -o -selection clipboard', '*': 'xclip -o -selection primary'}, 'name': 'xclip-custom', 'cache-enabled': 0}")

vim.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = "256" -- Support 256 colors
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = O.number -- set numbered lines
vim.wo.relativenumber = O.relative_number -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
vim.o.guifont = "MesloLGM\\ Nerd\\ Font\\ Mono:h17" -- Font
vim.o.lazyredraw = true -- redraw
vim.o.visualbell = true -- bell
vim.o.ignorecase = true -- better search
vim.o.smartcase = true -- better search
vim.o.fixendofline = true
