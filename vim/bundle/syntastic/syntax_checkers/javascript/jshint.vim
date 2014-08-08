"============================================================================
"File:        jshint.vim
"Description: Javascript syntax checker - using jshint
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

if exists('g:loaded_syntastic_javascript_jshint_checker')
    finish
endif
let g:loaded_syntastic_javascript_jshint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_javascript_jshint_IsAvailable() dict
    call syntastic#log#deprecationWarn('jshint_exec', 'javascript_jshint_exec')
    if !executable(self.getExec())
        return 0
    endif
    let s:jshint_version = syntastic#util#getVersion(self.getExecEscaped() . ' --version')
    return syntastic#util#versionIsAtLeast(s:jshint_version, [1])
endfunction

function! SyntaxCheckers_javascript_jshint_GetLocList() dict
    call syntastic#log#deprecationWarn('javascript_jshint_conf', 'javascript_jshint_args',
        \ "'--config ' . syntastic#util#shexpand(OLD_VAR)")

    if !exists('s:jshint_new')
        let s:jshint_new = syntastic#util#versionIsAtLeast(s:jshint_version, [1, 1])
    endif

    let makeprg = self.makeprgBuild({ 'args_after': (s:jshint_new ? '--verbose ' : '') })

    let errorformat = s:jshint_new ?
        \ '%A%f: line %l\, col %v\, %m \(%t%*\d\)' :
        \ '%E%f: line %l\, col %v\, %m'

<<<<<<< HEAD
    call self.setWantSort(1)
=======
    let errorformat = jshint_new ?
        \ '%A%f: line %l\, col %v\, %m \(%t%*\d\)' :
        \ '%E%f: line %l\, col %v\, %m'
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
<<<<<<< HEAD
        \ 'defaults': {'bufnr': bufnr('')},
        \ 'returns': [0, 2] })
=======
        \ 'defaults': {'bufnr': bufnr('')} })
endfunction

function! s:JshintNew()
    return syntastic#util#versionIsAtLeast(syntastic#util#getVersion(expand(g:syntastic_jshint_exec) . ' --version'), [1, 1])
endfunction

function! s:Args()
    " node-jshint uses .jshintrc as config unless --config arg is present
    return !empty(g:syntastic_javascript_jshint_conf) ? ' --config ' . g:syntastic_javascript_jshint_conf : ''
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'javascript',
    \ 'name': 'jshint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
