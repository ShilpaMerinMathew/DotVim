
"=============================
"Sample .vimrc file by Shilpa
"=============================


"Automatic reloading of .vimrc
"=============================

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Vundle Plugins
"========================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'powerline/powerline'

Plugin 'tpope/vim-fugitive'  "Git

Plugin 'tpope/vim-surround' "surround; quoting

Plugin 'scrooloose/nerdtree' "tree like explorer

Plugin 'tmhedberg/SimpylFold' "Code  Folding

Plugin 'davidhalter/jedi-vim'

Plugin 'Vimjas/vim-python-pep8-indent'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'fatih/vim-go' "GO language

Plugin 'moby/moby' "Docker

Plugin 'jceb/vim-orgmode' "Vim-Org

Plugin 'itchyny/lightline.vim'

" Add plugins here
call vundle#end()


"Rebinding leader Key
"==================
let mapleader = ","


"Edit vimrc on the fly
"====================
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>



" Allow us to use Ctrl-s and Ctrl-q as keybinds
"===============================================
silent !stty -ixon


" " Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

"Lightline
"=======================
set laststatus=2
set noshowmode
let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }



"Editor Color Scheme
"=======================
set background=light
colorscheme PaperColor

"Language specific color options
"==============[==============================================]==========
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1,
  \       'python_highlight_builtin_funcs':1,
  \       'python_highlight_indent_errors':1,
  \       'python_highlight_space_errors':1       
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
"================[==============================================]======

"Mouse
"============================
set mouse=a

"Hidden Buffer
"================
set hidden


"Show= invisible and color
"=================[=================================================]===
nmap <Leader>l :set list!<CR>
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set listchars=tab:▸\ ,eol:❤

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
"===============[==============================================]=========

"Spelling Correction(American English)
"======================
set spell spelllang=en_us

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

"Easier moving between tabs
"==========================
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


"Easier moving of code Blocks
"===========================
vnoremap > >gv " better indentation
vnoremap < <gv " better indentation

"Enable syntax highlighting
"=============================
" Enable file type detection
filetype on
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

filetype plugin indent on
syntax on

"Indent on Pasting
"===========================
set pastetoggle=<F2>


"Showing line number and length
"==============================
set number      "show number line
set tw=79       "width of document

"Wrapping text
"=================
command! -nargs=* Wrap set wrap linebreak nolist
set showbreak=◍
set colorcolumn=80,100
highlight ColorColumn ctermbg=233


"Useful setting
"==================
set history=700
set undolevels=700

"Real Programmers don't use tabs but spaces
"============================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set shiftround
set nocompatible

"Make search case insensitive
"============================
set incsearch
set hlsearch
set ignorecase
set smartcase


" Syntax highlight on
"========================
syntax on

"Disable stupid backup files and swap files
"===========================================
set nobackup
set noswapfile
set nowritebackup

"Allow plugins by file type (required for plugins!)
"===================================================
filetype plugin on
filetype indent on



" JEDI
" ==================
let g:jedi#popup_select_first = 1 "Jedi selects the first line of the completion menu


" NERD Tree
" =================
"
" " toggle nerd tree display
map <F3> :NERDTreeToggle<CR>
" " don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" " nerd tree when entering vim
"autocmd vimenter * NERDTree  "nerd tree custom




"Key Mapping
"==============
"
:map <C-a> GVgg
:map <C-n> :enew
:map <C-o> :e . <Enter>
:map <C-c> y
:map <C-s> :w <Enter> <CR> :echo "Saved" <CR>
:map <C-x> d
:map <C-z> :q! <Enter>
:map <C-i> >>
:map <C-j> <<
:map <C-h> :%s/

