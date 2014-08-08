"============================================================================
"File:        perl.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Anthony Carapetis <anthony.carapetis at gmail dot com>,
"             Eric Harmon <http://eharmon.net>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
"
<<<<<<< HEAD
" Security:
"
" This checker runs 'perl -c' against your file, which in turn executes
" any BEGIN, UNITCHECK, and CHECK blocks, and any use statements in
" your file.  This is probably fine if you wrote the file yourself,
" but it can be a problem if you're trying to check third party files.
" If you are 100% willing to let Vim run the code in your file, set
" g:syntastic_enable_perl_checker to 1 in your vimrc to enable this
" checker:
"
"   let g:syntastic_enable_perl_checker = 1
"
" References:
"
" - http://perldoc.perl.org/perlrun.html#*-c*
"
" Checker options:
"
" - g:syntastic_perl_interpreter (string; default: 'perl')
"   The perl interpreter to use.
"
" - g:syntastic_perl_lib_path (list; default: [])
"   List of include directories to be added to the perl command line. Example:
"
=======
" Checker options:
"
" - g:syntastic_perl_interpreter (string; default: 'perl')
"   The perl interpreter to use.
"
" - g:syntastic_perl_lib_path (list; default: [])
"   List of include directories to be added to the perl command line. Example:
"
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
"       let g:syntastic_perl_lib_path = [ './lib', './lib/auto' ]

if exists('g:loaded_syntastic_perl_perl_checker')
    finish
endif
let g:loaded_syntastic_perl_perl_checker = 1

<<<<<<< HEAD
=======
if !exists('g:syntastic_perl_interpreter')
    let g:syntastic_perl_interpreter = 'perl'
endif

>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
if !exists('g:syntastic_perl_lib_path')
    let g:syntastic_perl_lib_path = []
endif

<<<<<<< HEAD
let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_perl_perl_IsAvailable() dict
    if !exists('g:syntastic_perl_perl_exec') && exists('g:syntastic_perl_interpreter')
        let g:syntastic_perl_perl_exec = g:syntastic_perl_interpreter
    endif

    " don't call executable() here, to allow things like
    " let g:syntastic_perl_interpreter='/usr/bin/env perl'
    silent! call system(self.getExecEscaped() . ' -e ' . syntastic#util#shescape('exit(0)'))
    return v:shell_error == 0
endfunction

function! SyntaxCheckers_perl_perl_GetLocList() dict
    if !exists('g:syntastic_enable_perl_checker') || !g:syntastic_enable_perl_checker
        call syntastic#log#error('checker perl/perl: checks disabled for security reasons; ' .
            \ 'set g:syntastic_enable_perl_checker to 1 to override')
        return []
    endif

    if type(g:syntastic_perl_lib_path) == type('')
        call syntastic#log#oneTimeWarn('variable g:syntastic_perl_lib_path should be a list')
        let includes = split(g:syntastic_perl_lib_path, ',')
    else
        let includes = copy(syntastic#util#var('perl_lib_path'))
=======
function! SyntaxCheckers_perl_perl_IsAvailable()
    return executable(g:syntastic_perl_interpreter)
endfunction

function! SyntaxCheckers_perl_perl_Preprocess(errors)
    let out = []

    for e in a:errors
        let parts = matchlist(e, '\v^(.*)\sat\s(.*)\sline\s(\d+)(.*)$')
        if !empty(parts)
            call add(out, parts[2] . ':' . parts[3] . ':' . parts[1] . parts[4])
        endif
    endfor

    return syntastic#util#unique(out)
endfunction

function! SyntaxCheckers_perl_perl_GetLocList()
    if type(g:syntastic_perl_lib_path) == type('')
        call syntastic#util#deprecationWarn('variable g:syntastic_perl_lib_path should be a list')
        let includes = split(g:syntastic_perl_lib_path, ',')
    else
        let includes = copy(exists('b:syntastic_perl_lib_path') ? b:syntastic_perl_lib_path : g:syntastic_perl_lib_path)
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
    endif
    let shebang = syntastic#util#parseShebang()
    let extra = join(map(includes, '"-I" . v:val')) .
        \ (index(shebang['args'], '-T') >= 0 ? ' -T' : '') .
        \ (index(shebang['args'], '-t') >= 0 ? ' -t' : '')
    let errorformat = '%f:%l:%m'

<<<<<<< HEAD
    let makeprg = self.makeprgBuild({ 'args_before': '-c -X ' . extra })
=======
    let makeprg = syntastic#makeprg#build({
        \ 'exe': g:syntastic_perl_interpreter,
        \ 'args': '-c -X ' . extra,
        \ 'filetype': 'perl',
        \ 'subchecker': 'perl' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    let errors = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
<<<<<<< HEAD
        \ 'preprocess': 'perl',
=======
        \ 'preprocess': 'SyntaxCheckers_perl_perl_Preprocess',
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
        \ 'defaults': {'type': 'E'} })
    if !empty(errors)
        return errors
    endif

<<<<<<< HEAD
    let makeprg = self.makeprgBuild({ 'args_before': '-c -Mwarnings ' . extra })
=======
    let makeprg = syntastic#makeprg#build({
        \ 'exe': g:syntastic_perl_interpreter,
        \ 'args': '-c -Mwarnings ' . extra,
        \ 'filetype': 'perl',
        \ 'subchecker': 'perl' })
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
<<<<<<< HEAD
        \ 'preprocess': 'perl',
=======
        \ 'preprocess': 'SyntaxCheckers_perl_perl_Preprocess',
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
        \ 'defaults': {'type': 'W'} })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'perl',
    \ 'name': 'perl'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
