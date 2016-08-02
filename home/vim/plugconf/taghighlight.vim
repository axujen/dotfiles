Bundle 'TagHighlight'


if !exists('g:TagHighlightSettings')
	let g:TagHighlightSettings = {}
endif
" Tags
let g:TagHighlightSettings['DoNotGenerateTags']=1 " Let easytags handle generating tags
let g:TagHighlightSettings['TagFileDirModePriority']=['Explicit', 'FileDirectory']
let g:TagHighlightSettings['TypesFileDirModePriority']=['Explicit', 'FileDirectory']

au BufNewFile,BufReadPost * call SetupGitDir()
function! SetupGitDir()
	let a:git_dir = expand("%:p:h")."/.git/"
	if isdirectory(a:git_dir)
		let a:tagfile = a:git_dir.'tags'
		execute 'setlocal tags='.escape(a:tagfile, ' ')
		if !exists('b:TagHighlightSettings')
			let b:TagHighlightSettings = {}
		endif
		let b:TagHighlightSettings['TypesFileDirectory']=a:git_dir
		let b:TagHighlightSettings['TagFileDirectory']=a:git_dir
	endif
endfunction
