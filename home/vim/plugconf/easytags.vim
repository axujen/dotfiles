Plugin 'xolox/vim-easytags'

let g:easytags_dynamic_files=1
let g:easytags_auto_highlight=1
let g:easytags_async=1
let g:easytags_syntax_keyword="always"
let g:easytags_auto_update = 0
let g:easytags_events = ['BufWritePost']
" let g:easytags_opts = ['--fields=+l']

function! InitTags()
	UpdateTags -R .
	UpdateTypesFileOnly
	silent !grep -qsFx "let b:easytags_auto_update = 1" ./.lvimrc || echo "let b:easytags_auto_update = 1" >> ./.lvimrc
	silent !grep -qsFx "let b:easytags_auto_recurse = 1" ./.lvimrc || echo "let b:easytags_auto_recurse = 1" >> ./.lvimrc
	let g:easytags_auto_update = 1
    let g:easytags_auto_recurse = 1
endfunction
command! InitTags call InitTags()
