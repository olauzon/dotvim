"============================================================================
"File:        co.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Andrew Kelley <superjoe30@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_co_coco_checker")
    finish
endif
let g:loaded_syntastic_co_coco_checker = 1

let s:save_cpo = &cpo
set cpo&vim

<<<<<<< HEAD
function! SyntaxCheckers_co_coco_GetLocList() dict
    let tmpdir = $TMPDIR != '' ? $TMPDIR : $TMP != '' ? $TMP : '/tmp'
    let makeprg = self.makeprgBuild({ 'args_after': '-c -o ' . tmpdir })
=======
function! SyntaxCheckers_co_coco_IsAvailable()
    return executable('coco')
endfunction

function! SyntaxCheckers_co_coco_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'coco',
        \ 'args': '-c -o /tmp',
        \ 'filetype': 'co',
        \ 'subchecker': 'coco' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat =
        \ '%EFailed at: %f,' .
        \ '%ZSyntax%trror: %m on line %l,'.
        \ '%EFailed at: %f,'.
        \ '%Z%trror: Parse error on line %l: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'co',
    \ 'name': 'coco'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
