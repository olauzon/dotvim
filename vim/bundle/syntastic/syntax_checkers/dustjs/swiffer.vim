"============================================================================
"File:        swiffer.vim
"Description: Dust.js syntax checker - using swiffer
"Maintainer:  Steven Foote <smfoote at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

if exists("g:loaded_syntastic_dustjs_swiffer_checker")
    finish
endif

let g:loaded_syntastic_dustjs_swiffer_checker = 1

<<<<<<< HEAD
let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_dustjs_swiffer_GetLocList() dict
    let makeprg = self.makeprgBuild({})
=======
function! SyntaxCheckers_dustjs_swiffer_IsAvailable()
    return executable('swiffer')
endfunction

function! SyntaxCheckers_dustjs_swiffer_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'swiffer',
        \ 'subchecker': 'swiffer',
        \ 'filetype': 'dustjs' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat = '%E%f - Line %l\, Column %c: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
 endfunction

call SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'dustjs',
    \ 'name': 'swiffer'})
<<<<<<< HEAD

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
=======
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
