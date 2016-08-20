Plugin 'xolox/vim-session'

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_to_last = 1
let g:session_default_overwrite = 'yes'
let g:session_save_color = 0
let g:session_command_aliases = 1
set sessionoptions-=help " Remove help buffers from sessions

if PluginIsLoaded("unite")
	" Create a session and bookmark it using unite
	function! MkSession(name, overwrite)
		" SaveSession(name, sfile)
		" name: Session name
	    
		let a:sessionfile = g:session_directory.'/'.a:name.g:session_extension
		if filereadable(glob(a:sessionfile)) && a:overwrite
			execute 'DeleteSession! '.a:name
		endif
		if !filereadable(a:sessionfile)
			execute 'SaveSession '.a:name
			let a:bmark = a:name."\t".a:sessionfile."\t\t"
			let a:bmark_file = g:unite_data_directory."/bookmark/Sessions"
			let a:sed_cmd = "!sed -si '/^".a:name."\t.*$/d' ".a:bmark_file
			let a:bmark_cmd = "!echo '".a:bmark."' >> ".a:bmark_file
			silent execute a:sed_cmd
			silent execute a:bmark_cmd
		else
			echoerr "\"".a:name."\" exists (add ! to overwrite)"
		endif
	
	endfunction
	command! -nargs=1 -bang MkSession call MkSession(<f-args>, <bang>0)

    function! RmSession(name)
        " name: Session name
        let a:sessionfile = g:session_directory.'/'.a:name.g:session_extension
        if filereadable(glob(a:sessionfile))
			let a:bmark = a:name."\t".a:sessionfile."\t\t"
			let a:bmark_file = g:unite_data_directory."/bookmark/Sessions"
			let a:sed_cmd = "!sed -si '/^".a:name."\t.*$/d' ".a:bmark_file
            execute 'DeleteSession! '.a:name
            silent execute a:sed_cmd
        else
            echoerr "\"".a:name."\" Does not exist!"
        endif
    endfunction
    command! -nargs=1 RmSession call RmSession(<f-args>)
endif
