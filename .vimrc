" ----
" vim
" ----
" Set nowrap
set nowrap

" Enable line numbers
set number

" Remap the leader key
let mapleader = ","

" Hide a buffer if edited
set hidden

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
execute "set <A-l>=\el"
nmap <A-l> :bnext<CR>
"nmap <leader>l :bnext<CR>

" Move to the previous buffer
execute "set <A-h>=\eh"
nmap <A-h> :bprevious<CR>
"nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Switch between different windows by their direction
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" ---------
" vim-plug
" ---------
call plug#begin()
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
call plug#end()

" ---------
" NERDTree
" ---------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" ------------
" vim-airline
" ------------
" Enable list of buffers (top bar)
let g:airline#extensions#tabline#enabled = 1

" Show just the filename (top bar)
let g:airline#extensions#tabline#fnamemod = ':t'
