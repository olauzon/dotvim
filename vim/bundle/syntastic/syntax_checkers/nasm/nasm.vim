"============================================================================
"File:        nasm.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Håvard Pettersson <haavard.pettersson at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_nasm_nasm_checker")
    finish
endif
let g:loaded_syntastic_nasm_nasm_checker = 1

let s:save_cpo = &cpo
set cpo&vim

<<<<<<< HEAD
function! SyntaxCheckers_nasm_nasm_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args_after': '-X gnu -f elf' .
        \       ' -I ' . syntastic#util#shescape(expand("%:p:h") . "/") .
        \       ' ' . syntastic#c#NullOutput() })
=======
function! SyntaxCheckers_nasm_nasm_GetLocList()
    let wd = syntastic#util#shescape(expand("%:p:h") . "/")
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'nasm',
        \ 'args': '-X gnu -f elf -I ' . wd . ' ' . syntastic#c#NullOutput(),
        \ 'filetype': 'nasm',
        \ 'subchecker': 'nasm' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat = '%f:%l: %t%*[^:]: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'nasm',
    \ 'name': 'nasm'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
