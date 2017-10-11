Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#whitespace#enabled = 1
if has('gui_running')
	let g:airline_powerline_fonts=1
	let g:airline_theme = 'jellybeans'
else
	let g:airline_left_sep = ''
	let g:airline_right_sep = ''
endif
