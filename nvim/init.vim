"Basic settings
filetype on
filetype plugin indent on

"Basic Mappings
let mapleader=" "

"" Faster Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Clear Search
nmap <silent><Leader>h :let @/=""<CR>
"" Fold
nnoremap <Leader>z za
"o and O do not enter insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>
"" Resource init.vim config file
map <Leader>s :source ~/.config/nvim/init.vim<CR>
"" Toggle linebreaks
noremap <silent><Leader>lb :set wrap!<CR>\| :set linebreak!<CR>
"" J/K move by wraps and lines
noremap j gj
noremap k gk
"" Kill AsyncRun
nnoremap <Leader>k :AsyncStop<CR>
"" Macro Fun
nnoremap <Leader>m @q
"" Next buffer
nnoremap <C-B> :bn<CR>
"" Open init.vim
nnoremap <Leader>p :edit ~/.config/nvim/init.vim <CR>
"" C-I remap fix
nnoremap <C-P> <C-i>
"" Insert python shebang
nnoremap <Leader>sb i#!/usr/bin/env python<CR><Esc>
nnoremap <Leader>ab :ColorizerToggle<CR>

"Sets
set termguicolors                   " True color support
set number				                  " Show number
set colorcolumn=100			            " Width column
set showmatch				                " Show matching bracket/paranth
set hidden				                  " Allow buffer switch without write
set history=100			      	        " More history
set hlsearch				                " Highlights search term
set splitbelow				              " Split window is now bellow
set splitright				              " Vsplit now to the right
set cursorline				              " Cursor line highlighted
set lazyredraw				              " Redraw when necessary
set foldlevel=99			              " Max fold by default
set title				                    " Title for window
set visualbell			      	        " Visual noise
set relativenumber			            " Numbers are relative to line
set incsearch				                " Find as typeing
set encoding=UTF-8			            " Defualt encoding
set clipboard^=unnamed,unnamedplus	" Copy to unnamed
set dir=~/.config/nvim/tmp		      " Dir for swp files
set ignorecase				              " Ignore case when searching
set smartcase				                " Lowercase is captial when searching
set mouse=""				                " Disable mouse
set nobackup				                " Delete backup on write
set nowritebackup 			            " Poossible issue fix
set updatetime=300			            " Update at 300 sec
set signcolumn=yes			            " Signs allowed
set nowrap				                  " Dont wrap line
set nolinebreak				              " Remove line break
set wildmenu                        " Show completion options
set cmdheight=2 			              " More room
set fixendofline 			              " No EOL on file save
set shortmess+=c 			              " CoC message fix
set expandtab                       " Tabs expanded to spaces

"Backspace fix
set backspace=indent,eol,start

"Terminal to source bash correctly
let &shell='/bin/bash'
let mapleader=" "

"Plugins
call plug#begin('~/.config/nvim/plugged')

 Plug 'liuchengxu/vim-clap'
 Plug 'airblade/vim-gitgutter'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'Shougo/context_filetype.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-scripts/indentpython.vim'
 Plug 'dense-analysis/ale'
 Plug 'raimondi/delimitmate'
 Plug 'luochen1990/rainbow'
 Plug 'yggdroot/indentline'
 Plug 'heavenshell/vim-pydocstring'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'
 Plug 'moll/vim-bbye'
 Plug 'neoclide/coc.nvim', {'branch' : 'release'}
 Plug 'sheerun/vim-polyglot'
 Plug 'vim-pandoc/vim-pandoc'
 Plug 'vim-pandoc/vim-pandoc-syntax'
 Plug 'wadackel/vim-dogrun'
 Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

"Plug Settings

"NERDTree
  map <Leader>t :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeDirArrowExpandable='▸'
  let g:NERDTreeDirArrowCollapsible='▾'

"Airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_theme='violet'

"Ale
 let g:ale_fixers={
                          \'python': ['autopep8', 'isort']}
 let g:ale_linters={
                         \ 'python': ['flake8']}
 let g:ale_linters_explicit = 1
 let g:ale_fix_on_save=1
 let g:ale_statusline_format = ['E%d', 'W%d', 'K']
 let g:ale_sign_column_always=1
 let g:ale_lint_delay=200
 let g:ale_lint_on_enter=1
 let g:ale_lint_on_save=1

"Rainbow
 let g:rainbow_active=1

"Indentline
 let g:indentLine_char='|'
 let g:indentLine_color_term=246

"Vim markdown
 let g:vim_markdown_fenced_languages = ['python=py']

"BBye
 nnoremap <silent><Leader>q :Bdelete<CR>

"CoC
 " Use <Tab> for completion trigger and navigation
 function! s:check_back_space() abort
 	let col = col('.') - 1
 	return !col || getline('.')[col - 1] =~# '\s'
 endfunction

  " Next by tab
 inoremap <silent><expr> <TAB>
 			\ pumvisible() ? "\<C-n>" :
 			\ <SID>check_back_space() ? "\<TAB>" :
 			\ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " c-space to trigger completion
 imap <expr><c-space> coc#refresh()

  " Do not auto to next line on completion
 inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Remap keys for gotos
   nmap <silent> gd <Plug>(coc-definition)
   nmap <silent> gy <Plug>(coc-type-definition)
   nmap <silent> gi <Plug>(coc-implementation)
   nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
 nnoremap <silent> K :call <SID>show_documentation()<CR>

 function! s:show_documentation()
 	if (index(['vim','help'], &filetype) >= 0)
 		execute 'h '.expand('<cword>')
 	else
 		call CocAction('doHover')
 	endif
 endfunction

  " Rename Function
   nmap <leader>rn <Plug>(coc-rename)

   let g:coc_disable_startup_warning = 1

" PyDocString
 let g:pydocstring_doq_path = '/home/nick/miniconda3/envs/Flex/bin/doq'
 let g:pydocstring_formatter = 'google'

" AsyncRun
 let g:asyncrun_open=8

" Pandoc
 au BufNewFile,BufFilePre,BufRead *.txt set filetype=pandoc
 let g:pandoc#filetypes#handled = ['pandoc', 'markdown', 'textile']
 let g:pandoc#biblio#use_bibtool = 1
 let g:pandoc#completion#bib#mode = 'fallback'
 let g:pandoc#syntax#conceal#use = 0

" Local spell
 autocmd FileType tex,md,markdown,pandoc, setlocal spell

" Color
 colorscheme dogrun

" Remove trailing whitespace and lines
function TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
autocmd BufWritePre * %s/\s\+$//e

"Vim clap
let g:clap_theme='dogrun'
nnoremap <Leader>f :Clap blines <CR>
nnoremap <Leader>c :Clap <CR>

" Coc-go
 autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Colorizer
 lua require'colorizer'.setup()
