"Python Specific settings
setlocal fileformat=unix
setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab
setlocal shiftwidth=4

"Plugin Specific
map <Leader>y :w!<CR> :AsyncRun -raw python %<CR>
let $PYTHONUNBUFFERED=1
nmap <silent> <C-i> <Plug>(pydocstring)

"Ale Specific
let b:ale_linters=['flake8']
let b:ale_fixers=['autopep8', 'isort']
let b:ale_python_flake8_options='--ignore=E501,E252,E124'
"
"Fix for python
let g:Python3_host_prog='/Users/rollernt/miniconda3/bin/python3'
