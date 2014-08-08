"============================================================================
"File:        asciidoc.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  LCD 47 <lcd047 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_asciidoc_asciidoc_checker")
    finish
endif
let g:loaded_syntastic_asciidoc_asciidoc_checker = 1

let s:save_cpo = &cpo
set cpo&vim

<<<<<<< HEAD
function! SyntaxCheckers_asciidoc_asciidoc_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args_after': syntastic#c#NullOutput() })
=======
function! SyntaxCheckers_asciidoc_asciidoc_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'asciidoc',
        \ 'args': syntastic#c#NullOutput(),
        \ 'filetype': 'asciidoc',
        \ 'subchecker': 'asciidoc' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat =
        \ '%Easciidoc: %tRROR: %f: line %l: %m,' .
        \ '%Easciidoc: %tRROR: %f: %m,' .
        \ '%Easciidoc: FAILED: %f: line %l: %m,' .
        \ '%Easciidoc: FAILED: %f: %m,' .
        \ '%Wasciidoc: %tARNING: %f: line %l: %m,' .
        \ '%Wasciidoc: %tARNING: %f: %m,' .
        \ '%Wasciidoc: DEPRECATED: %f: line %l: %m,' .
        \ '%Wasciidoc: DEPRECATED: %f: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'returns': [0, 1] })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'asciidoc',
    \ 'name': 'asciidoc'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
