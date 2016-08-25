Plugin 'xolox/vim-easytags'

let g:easytags_async=1
let g:easytags_syntax_keyword="always"
let g:easytags_dynamic_files=2
let g:easytags_auto_highlight=0
let g:easytags_auto_update = 0

function! InitTags()
	silent !grep -qsFx "let b:easytags_auto_update = 1" ./.lvimrc  || echo "let b:easytags_auto_update  = 1"  > ./.lvimrc
	silent !grep -qsFx "let b:easytags_auto_recurse = 1" ./.lvimrc || echo "let b:easytags_auto_recurse = 1" >> ./.lvimrc
    silent !echo "au BufWritePost *  UpdateTags -R" >> ./.lvimrc
    silent !echo "au BufWritePost *  HighlightTags" >> ./.lvimrc
	let g:easytags_auto_update  = 1
    let g:easytags_auto_recurse = 1
    au BufWritePost *  UpdateTags -R
    au BufWritePost *  HighlightTags
    
    " Put tags in .git/tags for git directories
	let a:git_dir = expand("%:p:h")."/.git/"
	if isdirectory(a:git_dir)
		let a:tagfile = a:git_dir.'tags'
        let &tags=a:tagfile
        let a:tagsettings='let &tags="' . a:tagfile . '"'
	    execute "silent !grep -qsFx '" . a:tagsettings . "' ./.lvimrc || echo '" . a:tagsettings . "' >> ./.lvimrc"
	endif

	UpdateTags -R
    HighlightTags
endfunction
command! InitTags call InitTags()

