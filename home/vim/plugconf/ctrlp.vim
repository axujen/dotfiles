Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'okcompute/vim-ctrlp-session'
Plugin 'sgur/ctrlp-extensions.vim'

" The Silver Searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -lf --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_use_caching = 0
let g:ctrlp_max_depth = 5
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_by_filename=1

" Keybinds
let g:ctrlp_map = "<C-c>"
nnoremap <C-x> :CtrlPTag<cr>
nnoremap <C-p> :CtrlPSession<cr>
nnoremap <leader>y :CtrlPYankring<cr>

" Sessions
let g:ctrlp_session_path = "~/.vim/sessions"
