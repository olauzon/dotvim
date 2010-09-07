set guifont=Monaco:h26

set number
set go-=T

set hidden

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Show invisible characters
set list
" Shortcut to toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

:syntax on

filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd BufNewFile,BufRead *.json_builder setf ruby
  autocmd BufNewFile,BufRead *.red setf ruby
  autocmd BufNewFile,BufRead *.erl set ai sw=4 sts=4 et
  autocmd BufNewFile,BufRead *.js set ft=javascript.jquery
augroup END

set ts=2
set sts=2
set sw=2
set autoindent
set smarttab
set expandtab

:colorscheme vividchalk

" window splitting mappings
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" Shortcut to toggle nerd tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Shortcut to delete trailing whitespace
nmap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Highlight lines longer than 80 characters
match ErrorMsg '\%>80v.\+'

inoremap kj <Esc>
