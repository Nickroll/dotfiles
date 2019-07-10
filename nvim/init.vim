"Basic settings
filetype on
colorscheme gruvbox

"Filetype Plugins
filetype plugin indent on

"Mappings
let mapleader=" "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>z za
nnoremap o o<Esc>
nnoremap O O<Esc>
map <Leader>s :source ~/.config/nvim/init.vim<CR>
map <Leader>q :bd<CR>
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)

" functions
function! s:check_back_space() abort
	let col = col('.') -1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword')
	else
		call CocAction('doHover')
	endif
endfunction


"Sets
set number
set colorcolumn=100
set showmatch
set hidden
set history=100
set hlsearch
set splitbelow
set splitright
set fileformat=unix
set cursorline
set wildmenu
set lazyredraw
set foldmethod=indent
set foldlevel=99
set title
set visualbell
set relativenumber
set incsearch
set encoding=UTF-8
set clipboard=unnamed
set dir=~/.config/nvim/tmp
set ignorecase
set smartcase
set mouse=""
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
set shortmess+=c


"AutoCMD
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufWritePre * :%s/\s\+$//e

"Backspace fix
set backspace=indent,eol,start

"Terminal to source bash correctly
let &shell='/bin/bash'
let mapleader=" "

call plug#begin('~/.config/nvim/plugged')

 Plug 'airblade/vim-gitgutter'
 Plug 'scrooloose/nerdtree'

  map <Leader>t :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd vimenter * NERDTree
  let g:NERDTreeDirArrowExpandable='▸'
  let g:NERDTreeDirArrowCollapsible='▾'

 Plug 'Xuyuanp/nerdtree-git-plugin'

 Plug 'morhetz/gruvbox'

 Plug 'Shougo/context_filetype.vim'

 Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1

 Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'

 Plug 'vim-scripts/indentpython.vim'

 Plug 'raimondi/delimitmate'
 "Plug 'w0rp/ale'
 " let g:ale_fixers={
 "                         \ '*':['remove_trailing_lines', 'trim_whitespace']}
 " let g:ale_fix_on_save=1
 " let g:ale_sign_column_always=1
 " let g:ale_lint_delay=200
 " let g:ale_lint_on_enter=1
 " let g:ale_lint_on_save=1

 Plug 'luochen1990/rainbow'
  let g:rainbow_active=1

 Plug 'yggdroot/indentline'
  let g:indentLine_char='¦'
  let g:indentLine_color_term=246

 Plug 'heavenshell/vim-pydocstring'

 Plug 'skywind3000/asyncrun.vim'

 Plug 'godlygeek/tabular'

 Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_fenced_languages = ['python=py']

 Plug 'iamcco/markdown-preview.nvim', {'do':{-> mkdp#util#install()}}
  let g:mkdp_auto_start=1

 Plug 'vimwiki/vimwiki'

 Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
