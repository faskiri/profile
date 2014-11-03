" Set project_root variable
if filereadable(expand("$PROJECT_ROOT/cmake/InstartCommon.cmake"))
  let g:project_root=$PROJECT_ROOT
elseif filereadable(expand("~/instart/kido/cmake/InstartCommon.cmake"))
  let g:project_root=expand("~/instart/kido")
elseif filereadable(expand("~/kido/cmake/InstartCommon.cmake"))
  let g:project_root=expand("~/kido")
else
  echo "Could not find your project root, please set $PROJECT_ROOT in env"
  echo "Searched " . expand("$PROJECT_ROOT/cmake/InstartCommon.cmake")
  echo "Searched " . expand("~/instart/kido/cmake/InstartCommon.cmake")
  echo "Searched " . expand("~/kido/cmake/InstartCommon.cmake")
endif

if match(getcwd(), g:project_root) == 0
  " Set path used in find/gf etc
  let &path=".," . g:project_root . "," . g:project_root . "/**,/opt/instart/toolchain/linux-x86_64/include/"

  " Set tag file
  let &tags=g:project_root . "/tags"
endif

set wildignore=*.o,*.obj,*.pb.*,*.rpc.*,*.pyc,*_pb2.*,*.js,b/**,bvg/**
" Dont use path files for autocomplete, takes forever
set complete-=i
