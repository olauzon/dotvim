"============================================================================
"File:        rubylint.vim
"Description: Checks Ruby source code using ruby-lint
"Maintainer:  Yorick Peterse <yorickpeterse@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_ruby_rubylint_checker")
    finish
endif

let g:loaded_syntastic_ruby_rubylint_checker = 1

<<<<<<< HEAD
let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_ruby_rubylint_GetLocList() dict
    if !exists('s:rubylint_new')
        let s:rubylint_new = syntastic#util#versionIsAtLeast(syntastic#util#getVersion(
            \ self.getExecEscaped() . ' --version'), [2])
    endif
    let makeprg = self.makeprgBuild({ 'args': (s:rubylint_new ? '' : 'analyze ') . '--presenter=syntastic' })
=======
function! SyntaxCheckers_ruby_rubylint_IsAvailable()
    return executable("ruby-lint")
endfunction

function! SyntaxCheckers_ruby_rubylint_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'ruby-lint',
        \ 'args': 'analyze --presenter=syntastic',
        \ 'filetype': 'ruby',
        \ 'subchecker': 'rubylint' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errorformat = '%f:%t:%l:%c: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'ruby',
<<<<<<< HEAD
    \ 'name': 'rubylint',
    \ 'exec': 'ruby-lint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
=======
    \ 'name': 'rubylint' })

" vim: set ts=4 sts=4 sw=4:
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
