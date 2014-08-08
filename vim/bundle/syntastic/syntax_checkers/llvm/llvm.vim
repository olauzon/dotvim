"============================================================================
"File:        llvm.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Andrew Kelley <superjoe30@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_llvm_llvm_checker")
    finish
endif
let g:loaded_syntastic_llvm_llvm_checker = 1

let s:save_cpo = &cpo
set cpo&vim

<<<<<<< HEAD
function! SyntaxCheckers_llvm_llvm_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args_after': syntastic#c#NullOutput() })
=======
function! SyntaxCheckers_llvm_llvm_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'llc',
        \ 'args': syntastic#c#NullOutput(),
        \ 'filetype': 'llvm',
        \ 'subchecker': 'llvm' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat = 'llc: %f:%l:%c: %trror: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'llvm',
    \ 'name': 'llvm',
    \ 'exec': 'llc'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
