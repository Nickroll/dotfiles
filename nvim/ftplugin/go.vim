setlocal fileformat=unix
setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab
setlocal shiftwidth=4


map <Leader>o :AsyncRun go build "%:p:h" <CR>
map <Leader>y :AsyncRun go run "%:p:h" <CR>
