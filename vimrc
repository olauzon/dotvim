" set guifont=Monaco:h16
set guifont=Menlo:h16
" http://www.google.com/webfonts/family?family=Lekton&subset=latin
" set guifont=Lekton:h18

set number
set go-=T

set hidden

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

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
  autocmd BufNewFile,Bufread *.json set ft=json
augroup END

set ts=2
set sts=2
set sw=2
set autoindent
set smarttab
set expandtab

" :colorscheme vividchalk
set background=dark
:colorscheme solarized
" :colorscheme mac_classic

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

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" TIP: if you write your \labels as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
