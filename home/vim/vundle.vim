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

" Load custom plugins
for plugin in split(glob("~/.vim/plugconf/*.vim"), "\n")
    exec "source" plugin
endfor

filetype plugin indent on " required!
" vim: ft=vim
