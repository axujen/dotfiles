Plugin 'xolox/vim-easytags'

let g:easytags_dynamic_files = 1
" let g:easytags_updatetime_min = 30000
" let g:easytags_updatetime_warn = 0
let g:easytags_auto_highlight=1 " Highlighting is slow
let g:easytags_async=1
let g:easytags_syntax_keyword="always"
let g:easytags_auto_update = 0
let g:easytags_events = ['BufWritePost']

function! InitTags()
	UpdateTags
	UpdateTypesFileOnly
	silent !grep -qsFx "let b:easytags_auto_update = 1" ./local.vim || echo "let b:easytags_auto_update = 1" >> ./local.vim
	let g:easytags_auto_update = 1
endfunction
command! InitTags call InitTags()
