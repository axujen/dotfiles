Plugin 'scrooloose/syntastic'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_log_list = 1
nnoremap <leader>l  :Errors<cr>
nnoremap <leader>ll :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>lc :lclose<cr>
