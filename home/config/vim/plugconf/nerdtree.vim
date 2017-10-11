Plugin 'scrooloose/nerdtree'

let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=0
let g:NERDTreeAutoCenter=1
let g:NERDTreeQuitOnOpen=1
let g:NERDChristmasTree=1

nnoremap <silent> <F1> :call NERDTreeToggleCWD()<cr>
nnoremap <silent> <F2> :call NERDTreeToggleFind()<cr>
function! NERDTreeToggleFind()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction
function! NERDTreeToggleCWD()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeCWD"
  endif
endfunction
