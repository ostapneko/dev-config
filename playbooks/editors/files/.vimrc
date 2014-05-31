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
map <leader>e :Explore<cr>
colo FreshCut
set isk+=-
set listchars=trail:~,tab:>-
set list
noremap <F6> :set modifiable nu<cr>:w!<cr>

nnoremap <leader>1 gt1
nnoremap <leader>2 gt2
nnoremap <leader>3 gt3
nnoremap <leader>4 gt4
nnoremap <leader>5 gt5
nnoremap <leader>6 gt6
nnoremap <leader>7 gt7
nnoremap <leader>8 gt8
nnoremap <leader>9 gt9
