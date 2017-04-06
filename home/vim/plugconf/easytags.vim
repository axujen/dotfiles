Plugin 'xolox/vim-easytags'

let g:easytags_opts = ['--options=$HOME/.vim/ctags/ctags.cnf']
let g:easytags_async=1
let g:easytags_syntax_keyword="always"
let g:easytags_dynamic_files=2
let g:easytags_auto_highlight=1
let g:easytags_auto_update = 0

function! TagsUpdate()
    let a:dirname = expand("%:p:h")
    execute 'UpdateTags -R ' a:dirname
endfunction
command TagsUpdate call TagsUpdate()

function! TagsInit()
	silent !grep -qsFx "let g:easytags_auto_update = 1" ./.lvimrc  || echo "let g:easytags_auto_update  = 1"  > ./.lvimrc
	silent !grep -qsFx "let g:easytags_auto_recurse = 1" ./.lvimrc || echo "let g:easytags_auto_recurse = 1" >> ./.lvimrc
    silent !grep -qsFx "let g:easytags_events = ['BufWritePost']" ./.lvimrc || echo "let g:easytags_events = ['BufWritePost']" >> ./.lvimrc
	let g:easytags_auto_update  = 1
    let g:easytags_auto_recurse = 1
    let g:easytags_events = ['BufWritePost']
    
    " Put tags in .git/tags for git directories
	let a:git_dir = expand("%:p:h")."/.git/"
	if isdirectory(a:git_dir)
		let a:tagfile = a:git_dir.'tags'
        let &tags=a:tagfile
        let a:tagsettings='let &tags="' . a:tagfile . '"'
	    execute "silent !grep -qsFx '" . a:tagsettings . "' ./.lvimrc || echo '" . a:tagsettings . "' >> ./.lvimrc"
	endif

    TagsUpdate
    HighlightTags
endfunction
command! TagsInit call TagsInit()
