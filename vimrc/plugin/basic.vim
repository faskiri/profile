" indents
set ts=2 sw=2 et

" Autocompletion
set wildmode=longest,list,full
set wildmenu

set modeline

colorscheme ron
match Error /\s\+$/

syntax on
syntax match Error /\s\+$/
match ErrorMsg '\%>80v.\+'
:highlight ExtraWhitespace ctermbg=red guibg=red
:2match ExtraWhitespace /\s\+\%#\@<!$/

set hlsearch
highlight Search  ctermbg=0 ctermfg=1

filetype indent on
filetype plugin on
set nocindent
