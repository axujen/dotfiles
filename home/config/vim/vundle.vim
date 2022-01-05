filetype off				   " required!

set rtp+=$XDG_CONFIG_HOME/vim/bundle/vundle/
call vundle#begin("$XDG_CONFIG_HOME/vim/bundle")

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Colorschemes
Plugin 'Lokaltog/vim-distinguished'

" Load custom plugins
for plugin in split(glob("$XDG_CONFIG_HOME/vim/plugconf/*.vim"), "\n")
    exec "source" plugin
endfor

call vundle#end()
filetype plugin indent on " required!
" vim: ft=vim
