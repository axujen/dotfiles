Plugin 'scrooloose/syntastic'

let g:syntastic_python_checkers = ['flake8']
" Ignore syntastic error about lines being too long
let g:syntastic_python_flake8_post_args='--ignore=E501,E128'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_log_list = 1
nnoremap <leader>l  :Errors<cr>
nnoremap <leader>ll :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>lc :lclose<cr>
