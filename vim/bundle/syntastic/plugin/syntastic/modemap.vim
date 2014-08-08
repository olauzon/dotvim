if exists("g:loaded_syntastic_modemap") || !exists("g:loaded_syntastic_plugin")
    finish
endif
let g:loaded_syntastic_modemap = 1

let g:SyntasticModeMap = {}

" Public methods {{{1

function! g:SyntasticModeMap.Instance() " {{{2
    if !exists('s:SyntasticModeMapInstance')
        let s:SyntasticModeMapInstance = copy(self)
        call s:SyntasticModeMapInstance.synch()
    endif

    return s:SyntasticModeMapInstance
endfunction " }}}2

<<<<<<< HEAD
function! g:SyntasticModeMap.synch() " {{{2
    if exists('g:syntastic_mode_map')
        let self._mode = get(g:syntastic_mode_map, 'mode', 'active')
        let self._activeFiletypes = copy(get(g:syntastic_mode_map, 'active_filetypes', []))
        let self._passiveFiletypes = copy(get(g:syntastic_mode_map, 'passive_filetypes', []))
=======
function! g:SyntasticModeMap.synch()
    if exists('g:syntastic_mode_map')
        let self._mode = get(g:syntastic_mode_map, 'mode', 'active')
        let self._activeFiletypes = get(g:syntastic_mode_map, 'active_filetypes', [])
        let self._passiveFiletypes = get(g:syntastic_mode_map, 'passive_filetypes', [])
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
    else
        let self._mode = 'active'
        let self._activeFiletypes = []
        let self._passiveFiletypes = []
    endif
<<<<<<< HEAD
endfunction " }}}2

function! g:SyntasticModeMap.allowsAutoChecking(filetype) " {{{2
=======
endfunction

function! g:SyntasticModeMap.allowsAutoChecking(filetype)
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
    let fts = split(a:filetype, '\m\.')

    if self.isPassive()
        return self._isOneFiletypeActive(fts)
    else
        return self._noFiletypesArePassive(fts)
    endif
endfunction " }}}2

function! g:SyntasticModeMap.isPassive() " {{{2
    return self._mode ==# 'passive'
endfunction " }}}2

<<<<<<< HEAD
function! g:SyntasticModeMap.toggleMode() " {{{2
    call self.synch()

    if self._mode ==# 'active'
=======
function! g:SyntasticModeMap.isPassive()
    return self._mode == 'passive'
endfunction

function! g:SyntasticModeMap.toggleMode()
    call self.synch()

    if self._mode == 'active'
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f
        let self._mode = 'passive'
    else
        let self._mode = 'active'
    endif
<<<<<<< HEAD
=======

    "XXX Changing a global variable.  Tsk, tsk...
    if !exists('g:syntastic_mode_map')
        let g:syntastic_mode_map = {}
    endif
    let g:syntastic_mode_map['mode'] = self._mode
endfunction
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

    "XXX Changing a global variable.  Tsk, tsk...
    if !exists('g:syntastic_mode_map')
        let g:syntastic_mode_map = {}
    endif
    let g:syntastic_mode_map['mode'] = self._mode
endfunction " }}}2

function! g:SyntasticModeMap.echoMode() " {{{2
    echo "Syntastic: " . self._mode . " mode enabled"
endfunction " }}}2

<<<<<<< HEAD
function! g:SyntasticModeMap.modeInfo(...) " {{{2
    echomsg 'Syntastic version: ' . g:syntastic_version
    let type = a:0 ? a:1 : &filetype
    echomsg 'Info for filetype: ' . type

    call self.synch()
    echomsg 'Mode: ' . self._mode
    if self._mode ==# 'active'
        if len(self._passiveFiletypes)
            let plural = len(self._passiveFiletypes) != 1 ? 's' : ''
            echomsg 'Passive filetype' . plural . ': ' . join(sort(copy(self._passiveFiletypes)))
        endif
    else
        if len(self._activeFiletypes)
            let plural = len(self._activeFiletypes) != 1 ? 's' : ''
            echomsg 'Active filetype' . plural . ': ' . join(sort(copy(self._activeFiletypes)))
        endif
    endif
    echomsg 'Filetype ' . type . ' is ' . (self.allowsAutoChecking(type) ? 'active' : 'passive')
endfunction " }}}2

" }}}1

" Private methods {{{1

function! g:SyntasticModeMap._isOneFiletypeActive(filetypes) " {{{2
    return !empty(filter(copy(a:filetypes), 'index(self._activeFiletypes, v:val) != -1'))
endfunction " }}}2

function! g:SyntasticModeMap._noFiletypesArePassive(filetypes) " {{{2
    return empty(filter(copy(a:filetypes), 'index(self._passiveFiletypes, v:val) != -1'))
endfunction " }}}2

" }}}1
=======
function! g:SyntasticModeMap._isOneFiletypeActive(filetypes)
    return !empty(filter(copy(a:filetypes), 'index(self._activeFiletypes, v:val) != -1'))
endfunction

function! g:SyntasticModeMap._noFiletypesArePassive(filetypes)
    return empty(filter(copy(a:filetypes), 'index(self._passiveFiletypes, v:val) != -1'))
endfunction
>>>>>>> f24ec72a6085dd713351d2e4a5d3c117f245596f

" vim: set sw=4 sts=4 et fdm=marker:
