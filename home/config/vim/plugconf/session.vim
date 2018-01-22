Plugin 'xolox/vim-session'

" Only save tabs in sessions
set sessionoptions=tabpages,curdir,folds
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_to_last = 1
let g:session_default_overwrite = 'yes'
let g:session_persist_colors = 0
let g:session_persist_font = 0
let g:session_persist_globals = []
let g:session_directory="~/.config/vim/sessions"
let g:session_command_aliases = 0
