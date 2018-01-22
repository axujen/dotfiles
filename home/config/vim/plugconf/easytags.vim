Plugin 'xolox/vim-easytags'

let g:easytags_opts = ['--options=$XDG_CONFIG_HOME/vim/ctags/ctags.cnf']
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
    
	let a:git_dir = expand("%:p:h")."/.git/"
	if isdirectory(a:git_dir) " Hide the tags file in .git
		let a:tagfile = a:git_dir."tags"
    else " otherwise put in .vimtags
        let a:tagfile = expand("%:p:h")."/.vimtags"
	endif

    " save settings to .lvimrc
    let &tags=a:tagfile
    let a:tagsettings='let &tags="' . a:tagfile . '"'
    execute "silent !grep -qsFx '" . a:tagsettings . "' ./.lvimrc || echo '" . a:tagsettings . "' >> ./.lvimrc"

    execute 'TagsUpdate'
    execute 'HighlightTags'
endfunction

command! TagsInit call TagsInit()
