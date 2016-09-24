filetype off				   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Required plugin libraries
Plugin 'L9'
Plugin 'Shougo/vimproc.vim'
Plugin 'tlib'
Plugin 'vim-addon-mw-utils'
Plugin 'xolox/vim-misc'

" Colorschemes
Plugin 'Lokaltog/vim-distinguished'

" Syntax
Plugin 'vim-scripts/indentpython.vim'
Plugin 'mediawiki'
Plugin 'kchmck/vim-coffee-script'

let g:LoadedPlugins=[]
function! PluginLoad(name)
	exec "source ~/.vim/plugconf/" . a:name . ".vim"
	call add(g:LoadedPlugins, a:name)
endfunction
command! -nargs=1 PluginLoad call PluginLoad(<args>)

function! PluginIsLoaded(name)
	if index(g:LoadedPlugins, a:name) == -1
		return 0
	else
		return 1
	endif
endfunction

" Source individual plugins
PluginLoad "nerdtree"
PluginLoad "tagbar"
PluginLoad "easymotion"
PluginLoad "delimitMate"
PluginLoad "singlecompile"
PluginLoad "airline"
PluginLoad "securemodelines"
PluginLoad "syntastic"
PluginLoad "tcomment"
PluginLoad "surround"
PluginLoad "easytags"
PluginLoad "session"
PluginLoad "goyo"
PluginLoad "git-gutter"
PluginLoad 'ultisnips'
PluginLoad "neocomplete"
PluginLoad "ctrlp"

filetype plugin indent on " required!
" vim: ft=vim
