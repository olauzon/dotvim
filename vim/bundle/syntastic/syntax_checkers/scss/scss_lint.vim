"============================================================================
"File:        scss_lint.vim
"Description: SCSS style and syntax checker plugin for Syntastic
"Maintainer:  Shane da Silva <shane@dasilva.io>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

if exists("g:loaded_syntastic_scss_scss_lint_checker")
    finish
endif
<<<<<<< HEAD
let g:loaded_syntastic_scss_scss_lint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_scss_scss_lint_IsAvailable() dict
    return
        \ executable(self.getExec()) &&
        \ syntastic#util#versionIsAtLeast(syntastic#util#getVersion(
        \       self.getExecEscaped() . ' --version'), [0, 12])
endfunction

function! SyntaxCheckers_scss_scss_lint_GetLocList() dict
    let makeprg = self.makeprgBuild({})
    let errorformat = '%f:%l [%t] %m'
    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style',
        \ 'returns': [0, 1, 65] })
=======
let g:loaded_syntastic_scss_scss_lint_checker=1

function! SyntaxCheckers_scss_scss_lint_IsAvailable()
    return executable('scss-lint')
endfunction

function! SyntaxCheckers_scss_scss_lint_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'scss-lint',
        \ 'filetype': 'scss',
        \ 'subchecker': 'scss_lint' })

    let errorformat = '%f:%l [%t] %m'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style'})

    return loclist
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scss',
<<<<<<< HEAD
    \ 'name': 'scss_lint',
    \ 'exec': 'scss-lint' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
=======
    \ 'name': 'scss_lint'})
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
