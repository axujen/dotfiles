Plugin 'junegunn/goyo.vim'

function! s:goyo_before()
endfunction

function! s:goyo_after()
  " Quit Vim if this is the only remaining buffer
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    qa
  endif
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
