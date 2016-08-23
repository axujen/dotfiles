Plugin 'Shougo/neosnippet.vim'
Plugin 'honza/vim-snippets'
" Bundle 'Shougo/neosnippet-snippets'

let g:snips_author='axujen'
let g:snips_author_mail='axujen at autistici.org'
let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" let g:neosnippet#snippets_directory = "~/.vim/snippets/"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" expand using return, jump using tab
if PluginIsLoaded("delimitMate")
	imap <expr><CR>	 neosnippet#expandable() ? '<Plug>(neosnippet_expand)' : '<Plug>delimitMateCR'
else
	imap <expr><CR>	 neosnippet#expandable() ? '<Plug>(neosnippet_expand)' : '<CR>'
endif

imap <expr><TAB> neosnippet#jumpable()   ? '<Plug>(neosnippet_jump)' : pumvisible() ? '<C-n>' : '<TAB>'
smap <expr><TAB> neosnippet#jumpable()   ? '<Plug>(neosnippet_jump)' : pumvisible() ? '<C-n>' : '<TAB>'
