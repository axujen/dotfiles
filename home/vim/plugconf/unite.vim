Plugin 'unite.vim'
Plugin 'tsukkee/unite-help'

" custom action for sourcing vim files
let s:source = {
\	'description': 'source the vim file.',
\	'is_selectable': 1,
\ }
function! s:source.func(candidates)
	for l:candidate in a:candidates
		execute 'OpenSession '.l:candidate.source_entry_name
	endfor
endfunction
call unite#custom_action('openable', 'src', s:source)
unlet s:source

let g:unite_prompt = "Search> "
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
call unite#filters#matcher_default#use(['matcher_glob'])
call unite#set_profile("", "smartcase", 1)

nnoremap <C-q>		        :<C-u>Unite -buffer-name=files		file_rec/async<cr>
nnoremap <leader>q	        :<C-u>Unite -buffer-name=mru		file_mru<cr>
nnoremap <leader>e	        :<C-u>Unite -buffer-name=buffer		buffer<cr>
nnoremap <leader><leader>y	:<C-u>Unite -buffer-name=yank		history/yank<cr>
nnoremap <C-y>          	:<C-u>Unite -buffer-name=yank		history/yank<cr>
nnoremap <leader>r	        :<C-u>Unite -buffer-name=register	register<cr>
nnoremap <leader>s	        :<C-u>Unite -buffer-name=sources	source<cr>
nnoremap <leader>h	        :<C-u>Unite -buffer-name=help		help<cr>
nnoremap <leader>/	        :<C-u>Unite -buffer-name=search		line<cr>
nnoremap <C-p>		        :<C-u>Unite -default-action=src -buffer-name=Sessions	bookmark:Sessions<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>	<Plug>(unite_select_next_line)
  imap <buffer> <C-k>	<Plug>(unite_select_previous_line)
  imap <buffer> <Tab>	<C-n>
endfunction
