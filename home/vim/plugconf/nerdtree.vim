Plugin 'scrooloose/nerdtree'

nnoremap <F1> :NERDTreeToggle<CR>

" Sync cwd with NERDTree
autocmd BufEnter * lcd %:p:h

let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoCenter=1
let g:NERDTreeQuitOnOpen=1
let g:NERDChristmasTree=1
