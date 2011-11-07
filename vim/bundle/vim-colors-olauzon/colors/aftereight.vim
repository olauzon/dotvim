" Vim color file
" Maintainer:  Olivier Lauzon <olauzon@gmail.com>
" Last Change:  $Date: 2011/05/06 16:37:49 $
" Last Change:  $Date: 2011/06/02 19:40:21 $
" URL:    http://github.com/olauzon/vim-colors/colors/aftereight.vim
" Version:  $Id: aftereight.vim,v 1.6 2003/06/02 19:40:21 olauzon Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
  syntax reset
    endif
endif
let g:colors_name="aftereight"

hi Normal  guifg=White guibg=grey20

" highlight groups
hi Cursor  guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit      guifg=grey50      guibg=#c2bfa5   gui=none
hi Folded         guifg=gold        guibg=grey30
hi FoldColumn     guifg=tan         guibg=grey30
hi IncSearch      guifg=slategrey   guibg=khaki
"hi LineNr
hi ModeMsg        guifg=goldenrod
hi MoreMsg        guifg=SeaGreen
hi NonText        guifg=#605050                     cterm=bold ctermfg=darkblue
hi Question       guifg=springgreen
hi Search         guibg=peru        guifg=wheat
hi SpecialKey     guifg=yellowgreen ctermfg=darkgreen
hi StatusLine     guibg=#c2bfa5     guifg=black gui=none
hi StatusLineNC   guibg=#c2bfa5     guifg=grey50 gui=none
hi Title          guifg=indianred
hi Visual  gui=none guifg=khaki     guibg=olivedrab
"hi VisualNOS
hi WarningMsg  guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment        guifg=orange
hi Constant       guifg=#ffa0a0
hi Identifier     guifg=palegreen
hi Statement      guifg=khaki
hi PreProc        guifg=indianred
hi Type           guifg=darkkhaki
hi Special        guifg=navajowhite
"hi Underlined
hi Ignore         guifg=grey40
"hi Error
hi Todo           guifg=orangered guibg=yellow2

hi ColorColumn    guibg=#443333

" color terminal definitions
hi ErrorMsg       cterm=bold ctermfg=7 ctermbg=1
hi IncSearch      cterm=NONE ctermfg=yellow ctermbg=green
hi Search         cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg        ctermfg=darkgreen
hi ModeMsg        cterm=NONE ctermfg=brown
" hi LineNr  ctermfg=3
hi LineNr         ctermfg=3 guifg=#f3abab guibg=#443333
hi Question       ctermfg=green
hi StatusLine     cterm=bold,reverse
hi StatusLineNC   cterm=reverse
hi VertSplit      cterm=reverse
hi Title          ctermfg=5
hi Visual         cterm=reverse
hi VisualNOS      cterm=bold,underline
hi WarningMsg     ctermfg=1
hi WildMenu       ctermfg=0 ctermbg=3
hi Folded         ctermfg=darkgrey ctermbg=NONE
hi FoldColumn     ctermfg=darkgrey ctermbg=NONE
hi DiffAdd        ctermbg=4
hi DiffChange     ctermbg=5
hi DiffDelete     cterm=bold ctermfg=4 ctermbg=6
hi DiffText       cterm=bold ctermbg=1
hi Comment        ctermfg=lightblue
hi Constant       ctermfg=darkred
hi Special        ctermfg=red
hi Identifier     ctermfg=6
hi Statement      ctermfg=3
hi PreProc        ctermfg=5
hi Type           ctermfg=2
hi Underlined     cterm=underline ctermfg=5
hi Ignore         cterm=bold ctermfg=7
hi Ignore         ctermfg=darkgrey
hi Error          cterm=bold ctermfg=7 ctermbg=1

"vim: sw=4
