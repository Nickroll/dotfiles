"Basic settings
filetype on
colorscheme gruvbox

"Filetype Plugins
filetype plugin on

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

"Backspace fix
set backspace=indent,eol,start

"Terminal to source bash correctly
let &shell='/bin/bash'
let mapleader=" "

call plug#begin('~/.config/nvim/plugged')

 Plug 'ervandew/supertab'
  let g:SuperTabClosePreviewOnPopupClose=1

 Plug 'airblade/vim-gitgutter'
 Plug 'scrooloose/nerdtree'
  map <Leader>n :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd vimenter * NERDTree
  let g:NERDTreeDirArrowExpandable='▸'
  let g:NERDTreeDirArrowCollapsible='▾'

 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'morhetz/gruvbox'
 Plug 'valloric/youcompleteme'
  "let g:ycm_add_preview_to_completeopt=1
  let g:ycm_confirm_extra_conf=0
  let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
  let g:ycm_python_binary_path='~/miniconda3/bin/python3'
  let g:ycm_max_num_candidates=10
  let g:ycm_autoclose_preview_after_completion=1
  let g:ycm_python_interpreter_path=''
  let g:ycm_python_sys_path=[]
  let g:ycm_extra_conf_vim_data=['g:ycm_python_interpreter_path', 'g:ycm_python_sys_path']
  let g:ycm_global_ycm_extra_conf='~/.config/nvim/global_extra_conf.py'
  let g:ycm_semantic_trings = {
                          \'c': ['->', '.'],
                          \'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                          \'re!\[.*\]\s'],
                          \'ocaml': ['.', '#'],
                          \'cpp,cuda,objcpp': ['->', '.', '::'],
                          \'perl': ['->'],
                          \'php': ['->', '::'],
                          \'cs,d,elixir,go,groovy,java,javascript,julia,perl6,scala,typescript,vb': ['.'],
                          \'ruby,rust': ['.', '::'],
                          \'lua': ['.', ':'],
                          \'python': ['re!\w{2}', '.', 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)'],
                          \'erlang': [':']}
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

 Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
 Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'

 Plug 'vim-scripts/indentpython.vim'
 Plug 'raimondi/delimitmate'
 Plug 'w0rp/ale'
  let g:ale_fixers={
                          \ '*':['remove_trailing_lines', 'trim_whitespace']}
  let g:ale_fix_on_save=1
  let g:ale_sign_column_always=1
  let g:ale_lint_delay=200
  let g:ale_lint_on_enter=1
  let g:ale_lint_on_save=1

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

call plug#end()
