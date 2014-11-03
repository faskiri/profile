function! LoadHeaderFile()
  0read ~/.vim/plugin/cpp/h.tmpl
  let path = expand("<afile>:p")
  let mangled_filename = toupper(substitute(substitute(path, g:project_root, 'INSTART', ''), '/\|\.', '_', 'g'))
  /__IFDEFS__
  delete
  execute "normal i#ifndef " . mangled_filename . "\r"
  execute "normal i#define " . mangled_filename . "\r"
  /#endif
  delete
  execute "normal i#endif // " . mangled_filename
  %s/__NS__/\=expand("<afile>:p:h:t")/g
  ?namespace
endfunction

function! LoadCppFile()
  0read ~/.vim/plugin/cpp/cpp.tmpl
  $
  let path = expand("<afile>:p:r")
  let include_path = substitute(substitute(path, g:project_root, '', ''), '/', '', '')
  execute 'normal i#include "' . include_path . '.h"'
endfunction
" Templates
:au BufNewFile *.c 0read ~/.vim/plugin/cpp/c.tmpl
:au BufNewFile *.h call LoadHeaderFile()
:au BufNewFile *.cpp call LoadCppFile()
:autocmd FileType c,cpp set comments-=://
:autocmd FileType c,cpp set comments+=:///
:autocmd FileType c,cpp set comments+=://
