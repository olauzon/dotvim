" set guifont=Monaco:h16
" set guifont=Menlo:h16
" http://www.google.com/webfonts/family?family=Lekton&subset=latin
set guifont=Lekton:h16

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set background=dark
" :colorscheme aftereight " vim-colors-olauzon based on anotherdark
:colorscheme bella        " vim-colors-olauzon based on twilight
" :colorscheme edward     " vim-colors-olauzon based on twilight
" :colorscheme twilight
" :colorscheme moria
" :colorscheme anotherdark
" :colorscheme candycode
" :colorscheme solarized
" :colorscheme mac_classic
" :colorscheme vividchalk

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set background=dark
" :colorscheme aftereight " vim-colors-olauzon based on anotherdark
:colorscheme bella " vim-colors-olauzon based on twilight
" :colorscheme edward "       vim-colors-olauzon based on twilight
" :colorscheme twilight
" :colorscheme moria
" :colorscheme anotherdark
" :colorscheme candycode
" :colorscheme solarized
" :colorscheme mac_classic
" :colorscheme vividchalk

set number
set go-=T

set hidden
set nowrap

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
  autocmd BufNewFile,BufRead *.clj* setf clojure
  autocmd BufNewFile,BufRead *.edn* setf clojure
  autocmd BufNewFile,BufRead *.edn* set syntax=clojure
  autocmd BufNewFile,BufRead *.pig.erb colorscheme bella
  autocmd BufNewFile,BufRead *.pig colorscheme bella
  autocmd BufNewFile,BufRead *.json_builder setf ruby
  autocmd BufNewFile,BufRead *.red setf ruby
  autocmd BufNewFile,BufRead *.erl set ai sw=4 sts=4 et
  autocmd BufNewFile,BufRead *.js set ft=javascript.jquery
  autocmd BufNewFile,Bufread *.json set ft=json
  autocmd BufNewFile,Bufread *.bones set ft=javascript
  autocmd BufNewFile,Bufread *.jst set ft=mustache
  autocmd BufNewFile,BufRead *.cql set syntax=cql
augroup END

set ts=2
set sts=2
set sw=2
set autoindent
set smarttab
set expandtab

" window splitting mappings
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" NERDTree
let NERDTreeShowHidden=1

" 'wycats' style NERDTree
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 3

" Shortcut to toggle nerd tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>t :execute 'NERDTreeToggle ' . getcwd()<CR>

" Shortcut to delete trailing whitespace
nmap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" Fix jslint.vim error according to
" https://github.com/hallettj/jslint.vim/issues/13
let $JS_CMD='node'

" Remove scrollbars
set go-=L
set guioptions-=r

" Fullscreen
" :set fu

" Text formatting with par http://www.nicemice.net/par/
" brew install par
set formatprg=par\ -w80r
nmap <leader>f gqip<CR>

set directory^=$HOME/.vim_swap// "put all swap files together in one place

" Highlight lines longer than 80 characters
" match ErrorMsg '\%>80v.\+'
set colorcolumn=81

" Hard wrap at column 80
" set textwidth=80

let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

let g:slime_target = "tmux"
