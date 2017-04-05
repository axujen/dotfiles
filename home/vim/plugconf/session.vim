Plugin 'xolox/vim-session'

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_to_last = 1
let g:session_default_overwrite = 'yes'
let g:session_save_color = 0
let g:session_command_aliases = 1

" Dont pollute sessions with options, put them in ./.lvimrc instead
set sessionoptions-=help
set sessionoptions-=options
set sessionoptions-=buffers
set sessionoptions-=winsize
