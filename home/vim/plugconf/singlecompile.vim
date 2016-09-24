Plugin 'SingleCompile'

nnoremap <F4> :SCCompileRun<cr>

" python2 default
call SingleCompile#ChooseCompiler('python', 'python2')
