filetype off				   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Required plugin libraries
Bundle 'L9'
Bundle 'Shougo/vimproc.vim'
Bundle 'tlib'
Bundle 'vim-addon-mw-utils'
Bundle 'xolox/vim-misc'

" Colorschemes
Bundle 'Lokaltog/vim-distinguished'

" Syntax
Bundle 'mediawiki'
Bundle 'kchmck/vim-coffee-script'

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
PluginLoad "unite"
PluginLoad "session"
PluginLoad "goyo"
PluginLoad "git-gutter"
PluginLoad 'ultisnips'
PluginLoad "neocomplete"

filetype plugin indent on " required!
" vim: ft=vim
