Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'okcompute/vim-ctrlp-session'
Plugin 'sgur/ctrlp-extensions.vim'
Plugin 'JazzCore/ctrlp-cmatcher'

" Settings
let g:ctrlp_use_caching = 0
let g:ctrlp_max_depth = 10
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_by_filename=0
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_regxp = 0
let g:ctrlp_match_window = 'top,order:ttb'

" Keybinds
let g:ctrlp_map = "<C-c>"
nnoremap <C-x> :CtrlPTag<cr>
nnoremap <C-p> :CtrlPSession<cr>
nnoremap <leader>y :CtrlPYankring<cr>

" Sessions
let g:ctrlp_session_path = "$XDG_CONFIG_HOME/vim/sessions"

" The Silver Searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -lf --nocolor -g ""'
    let g:ctrlp_lazy_update = 1
endif

" ripgrep
if executable('rg')
    " ripgrep is fastest, so use it
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_lazy_update = 1
endif
