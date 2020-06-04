" Remap the escape key, remove mapping for q (record) and Q (Ex mode)
noremap q <Nop>
noremap Q <Nop>
noremap qq <esc>
inoremap qq <esc>
cnoremap qq <c-u><bs>

" Sets relative number and goes to absolute number if not in focus
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" positions nerd tree to the left
let g:NERDTreeWinPos = "left"

" characters after 80 will be in magenta 
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" blinks when pressing n after find
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext(blinktime)
    highlight BlackOnBlack ctermfg=black ctermbg=black
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let hide_pat = '\%<'.lnum.'l.'
        \ . '\|'
        \ . '\%'.lnum.'l\%<'.col.'v.'
        \ . '\|'
        \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
        \ . '\|'
        \ . '\%>'.lnum.'l.'
    let hide = matchadd('BlackOnBlack', hide_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(hide)
    redraw
endfunction

" Disable folding by default
set nofoldenable

" UTF-8 Support for python
set encoding=utf-8


" NerdTreeTabs stuff
" let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" ALE
let g:ale_linters = {
\   'python': []
\}

" YouCompleteMe 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Vundle 
set nocompatible              " required
filetype off                  " required

" set the runtime<Plug>PeepOpenath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively,<Plug>PeepOpenass a<Plug>PeepOpenath where Vundle should install<Plug>PeepOpenlugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomtom/tcomment_vim'
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on 

" SnipMate
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger


let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

