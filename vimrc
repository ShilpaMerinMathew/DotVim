" ===========================
" .vimrc file by Shilpa
" ===========================


" Automatic reloading of .vimrc
" =============================
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Rebinding leader Key
" ==================
let mapleader = ","

" Vundle Plugins
" ========================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

"------------------===Version Control===-------------
    Plugin 'tpope/vim-fugitive'  " Git

"-------------------===Code/Project navigation===-------------
    Plugin 'scrooloose/nerdtree'                " tree like explorer
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

"-------------------===Languages support===------------------
    Plugin 'davidhalter/jedi-vim'               " Python completion
    "Plugin 'valloric/youcompleteme'             " Code completion
    Plugin 'ervandew/supertab'                  " tab
    Plugin 'timothycrosley/isort'               " sort imports
    Plugin 'google/yapf'                        " code formatter
    Plugin 'dense-analysis/ale'                 " ALE
    Plugin 'maximbaz/lightline-ale'             " Lightline-ALE

"-------------------===Python===-----------------------------
    "Plugin 'pythoncomplete'                     " Python Code Completion
    "Plugin 'maralla/completor.vim'
    Plugin 'deoplete-plugins/deoplete-jedi'
    Plugin 'klen/python-mode'                   " Python mode(docs, refactor, lints...)
    Plugin 'Vimjas/vim-python-pep8-indent'      " python indent

"-------------------===Snippets support===--------------------
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'                 " snippets repository

"-------------------===Languages===-------------------------------
    "Plugin 'fatih/vim-go'                       " GO language
    "Plugin 'moby/moby'                          " Docker
    Plugin 'jceb/vim-orgmode'                   " Vim-Org

"-------------------===Other===-------------------------------
    Plugin 'tpope/vim-surround'                 " surround; quoting
    Plugin 'NLKNguyen/papercolor-theme'         " Paper Color theme
    Plugin 'itchyny/lightline.vim'              " status bar
    Plugin 'tmhedberg/SimpylFold'               " Code  Folding

" Add plugins here
call vundle#end()

" JEDI
" ===================
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#completions_command = "<C-Space>"
        let g:jedi#rename_command = "<leader>r"
        let g:jedi#popup_select_first = 1 "Jedi selects the first line of the completion menu
        let g:jedi#force_py_version = 3
        let g:jedi#completions_enabled = 1
        let g:jedi#popup_on_dot = 1
        let g:jedi#use_splits_not_buffers = "left"
        let g:jedi#smart_auto_mappings = 1
"PYMODE
"================
        let g:pymode_rope = 0

" ISORT
" ============================
    autocmd FileType python nnoremap <leader>s :!isort %<CR><CR>
" YAPF
" ===============
    autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

" UltiSnip settings
" ====================================================
    "let g:UltiSnipsExpandTrigger = "<ctrl-q>"
    " vertically split ultisnips edit window
    "let g:UltiSnipsEditSplit="vertical"

" You Complete Me
" ====================
	let g:ycm_python_interpreter_path = '/home/shilpa/.pyenv/shims/python3.7'
	let g:ycm_python_sys_path = []
	let g:ycm_extra_conf_vim_data = ['g:ycm_python_interpreter_path',
  	\  'g:ycm_python_sys_path'
  	\]
	let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

	"let g: ycm_autoclose_preview_window_after_completion = 1
    "let g:ycm_use_ultisnips_completer = 1

    "let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
    "let g:ycm_clangd_binary_path = exepath("clangd")
    "let g:ycm_clangd_uses_ycmd_caching = 1
    "let g:ycm_confirm_extra_conf = 1



" Edit vimrc on the fly
" ====================
    nmap <leader>v :tabedit $MYVIMRC<CR>



" Allow us to use Ctrl-s and Ctrl-q as keybinds
" ===============================================
    "silent !stty -ixon


"" Restore default behaviour when leaving Vim.
    "autocmd VimLeave * silent !stty ixon

" Lightline
" =======================
    set laststatus=2
    set noshowmode
    let g:lightline={
            \   'colorscheme': 'wombat',
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \   },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }


" Editor Color Scheme
" =======================
    set background=light
    colorscheme PaperColor

" Language specific color options
" ==============[==============================================]==========
    let g:PaperColor_Theme_Options={
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
" ================[==============================================]======

" Mouse
" ============================
    set mouse=a

" Hidden Buffer
" ================
    set hidden


" Show= invisible and color
" =================[=================================================]===
    nmap <Leader>l :set list!<CR>
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
    set listchars=tab:▸\ ,eol:❤

    " Delete trailing white space on save, useful for Python ;)
    func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite .vimrc :call DeleteTrailingWS()
    autocmd BufWrite .zshrc :call DeleteTrailingWS()


" Spelling Correction(American English)
" ======================
    set spell spelllang=en_us

" Toggle spell checking on and off with `,s`
" nmap <silent> <leader>s :set spell!<CR>

" Easier moving between tabs
" ==========================
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>


" Easier moving of code Blocks
" ===========================
    vnoremap > >gv " better indentation
    vnoremap < <gv " better indentation

" Enable syntax highlighting
" =============================
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

" Indent on Pasting
" ===========================
    set pastetoggle=<F2>


" Showing line number and length
" ==============================
    set number      "show number line
    set tw=79       "width of document

" Wrapping text
" =================
    command! -nargs=* Wrap set wrap linebreak nolist
    set showbreak=◍
    set colorcolumn=80,100
    highlight ColorColumn ctermbg=233


" Useful setting
" ==================
    set history=700
    set undolevels=700

" Real Programmers don't use tabs but spaces
" ============================================
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
    set expandtab
    set shiftround
    set nocompatible

" Make search case insensitive
" ============================
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase


" Syntax highlight on
" ========================
    syntax on

" Disable stupid backup files and swap files
" ===========================================
    set nobackup
    set noswapfile
    set nowritebackup

" Allow plugins by file type (required for plugins!)
" ===================================================
    filetype plugin on
    filetype indent on



" NERD Tree
" =================

    " " toggle nerd tree display
    map <F3> :NERDTreeToggle<CR>
    " " don't show these file types
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
    let NERDTreeWinSize=20
    "autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments



" Key Mapping
" ==============
"
    map <C-a> GVgg
    map <C-n> :enew
    map <C-o> :e . <Enter>
    map <C-c> y
    map <C-s> :w <Enter> <CR> :echo "Saved" <CR>
    map <C-x> d
    map <C-z> :q! <Enter>
    map <C-i> >>
    map <C-j> <<
    map <C-h> :%s/
