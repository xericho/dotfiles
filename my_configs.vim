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
map <leader>d  :YcmCompleter GetDoc<CR>

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
Plugin 'tpope/vim-obsession'
" Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'othree/xml.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'machakann/vim-highlightedyank'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on 

" SnipMate
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger


let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" Runs python files in vim
imap <F5> <Esc>:w<CR>:!clear;python %<CR>
nmap <F5> <Esc>:w<CR>:!clear;python %<CR>

" Refine emmet trigger key
imap <leader>b <C-y>,
let g:user_emmet_settings = {
  \  'html': {
  \    'indent_blockelement': 1,
  \ },
  \  'htmldjango' : {
  \    'extends' : 'html',
  \  },
  \}

" Enable cursor line position tracking:
:set cursorline
" Remove the underline from enabling cursorline:
:highlight clear CursorLine
" Set line numbering to red background:
:highlight CursorLineNR ctermbg=blue

" Change highlighted yank to half sec
let g:highlightedyank_highlight_duration = 200
