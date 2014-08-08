"============================================================================
"File:        verilator.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Kocha <kocha dot lsifrontend at gmail dot com>
"============================================================================

if exists("g:loaded_syntastic_verilog_verilator_checker")
    finish
endif
let g:loaded_syntastic_verilog_verilator_checker = 1

<<<<<<< HEAD
if !exists('g:syntastic_verilog_compiler_options')
    let g:syntastic_verilog_compiler_options = '-Wall'
=======
if !exists('g:syntastic_verilog_compiler')
    let g:syntastic_verilog_compiler = 'verilator'
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
endif

let s:save_cpo = &cpo
set cpo&vim

<<<<<<< HEAD
function! SyntaxCheckers_verilog_verilator_IsAvailable() dict
    if !exists('g:syntastic_verilog_compiler')
        let g:syntastic_verilog_compiler = self.getExec()
    endif
    return executable(expand(g:syntastic_verilog_compiler))
endfunction

function! SyntaxCheckers_verilog_verilator_GetLocList() dict
=======
function! SyntaxCheckers_verilog_verilator_IsAvailable()
    return executable(g:syntastic_verilog_compiler)
endfunction

if !exists('g:syntastic_verilog_compiler_options')
    let g:syntastic_verilog_compiler_options = '-Wall'
endif

function! SyntaxCheckers_verilog_verilator_GetLocList()
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
    return syntastic#c#GetLocList('verilog', 'verilator', {
        \ 'errorformat':
        \     '%%%trror-%\=%\w%#: %f:%l: %m,' .
        \     '%%%tarning-%\=%\w%#: %f:%l: %m',
        \ 'main_flags': '--lint-only' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'verilog',
<<<<<<< HEAD
    \ 'name': 'verilator' })
=======
    \ 'name': 'verilator'})
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
