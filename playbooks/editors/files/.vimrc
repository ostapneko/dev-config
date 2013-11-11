call pathogen#infect()
syntax on
filetype plugin indent on
set guicursor+=a:blinkon0
set number
set t_Co=256
set history=2000
inoremap jk <ESC>
nnoremap <F5> :source ~/.vimrc <CR>
nnoremap  <TAB> :
set et sts=2 sw=2
map <leader>t :CommandT<cr>
set guifont=Ubuntu\ Mono\ 14
colo FreshCut
set isk+=-
set listchars=trail:~,tab:>-
set list
noremap <F6> :CtrlPClearAllCaches<cr>
