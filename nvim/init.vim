"Basic settings
filetype on
colorscheme gruvbox
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

"Sets
set number				" Show number
set colorcolumn=100			" Width column
set showmatch				" Show matching bracket/paranth
set hidden				" Allow buffer switch without write
set history=100				" More history
set hlsearch				" Highlights search term
set splitbelow				" Split window is now bellow
set splitright				" Vsplit now to the right
set fileformat=unix			" Format is unix by default
set cursorline				" Cursor line highlighted
set lazyredraw				" Redraw when necessary
set foldmethod=indent			" Fold on indents
set foldlevel=99			" Max fold by default
set title				" Title for window
set visualbell				" Visual noise
set relativenumber			" Numbers are relative to line
set incsearch				" Find as typeing
set encoding=UTF-8			" Defualt encoding
set clipboard=unnamed			" Copy to unnamed
set dir=~/.config/nvim/tmp		" Dir for swp files
set ignorecase				" Ignore case when searching
set smartcase				" Lowercase is captial when searching
set mouse=""				" Disable mouse
set nobackup				" Delete backup on write
set updatetime=300			" Update at 300 sec
set signcolumn=yes			" Signs allowed
set nowrap				" Dont wrap line
set nolinebreak				" Remove line break
set wildmenu                            " Show completion options
set cmdheight=2 			" More room

"AutoCMD
"" Remove Trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e


"Backspace fix
set backspace=indent,eol,start

"Terminal to source bash correctly
let &shell='/bin/bash'
let mapleader=" "

"Plugins
call plug#begin('~/.config/nvim/plugged')

 Plug 'airblade/vim-gitgutter'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'morhetz/gruvbox'
 Plug 'Shougo/context_filetype.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-scripts/indentpython.vim'
 Plug 'raimondi/delimitmate'
 Plug 'w0rp/ale'
 Plug 'luochen1990/rainbow'
 Plug 'yggdroot/indentline'
 Plug 'heavenshell/vim-pydocstring'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'
 Plug 'iamcco/markdown-preview.nvim', {'do':{-> mkdp#util#install()}}
 Plug 'vimwiki/vimwiki'
 Plug 'moll/vim-bbye'
 Plug 'neoclide/coc.nvim', {'branch' : 'release'}
 Plug 'sheerun/vim-polyglot'

call plug#end()

"Plug Settings

"NERDTree
  map <Leader>t :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd vimenter * NERDTree
  let g:NERDTreeDirArrowExpandable='▸'
  let g:NERDTreeDirArrowCollapsible='▾'

"Airline
  let g:airline_theme='gruvbox'
  let g:airline#extensions#tabline#enabled = 1

"Ale
 let g:ale_fixers={
                          \ '*':['remove_trailing_lines', 'trim_whitespace']}
 let g:ale_fix_on_save=1
 let g:ale_statusline_format = ['E%d', 'W%d', 'K']
 let g:ale_sign_column_always=1
 let g:ale_lint_delay=200
 let g:ale_lint_on_enter=1
 let g:ale_lint_on_save=1

"Rainbow
 let g:rainbow_active=1

"Indentline
 let g:indentLine_char='¦'
 let g:indentLine_color_term=246

"Vim markdown
 let g:vim_markdown_fenced_languages = ['python=py']

"Md preview
 let g:mkdp_auto_start=1

"BBye
 nnoremap <silent><Leader>q :Bdelete<CR>

"CoC
 " Use <Tab> for completion trigger and navigation
  function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1] =~ '\s'
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
