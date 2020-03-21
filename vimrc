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
    Plugin 'airblade/vim-gitgutter'

"-------------------===Code/Project navigation===-------------
    Plugin 'scrooloose/nerdtree'                " tree like explorer
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }  "fuzzy finder

"-------------------===Languages support===------------------
    Plugin 'davidhalter/jedi-vim'                " Python completion
    "Plugin 'valloric/youcompleteme'             " Code completion
    Plugin 'ervandew/supertab'                  " tab
    Plugin 'timothycrosley/isort'                " sort imports
    Plugin 'google/yapf'                        " code formatter
    "Plugin 'dense-analysis/ale'                 " ALE
    "Plugin 'maximbaz/lightline-ale'             " Lightline-ALE
    Plugin 'chr4/nginx.vim'                      " for nginx

"-------------------===Python===-----------------------------
    "Plugin 'deoplete-plugins/deoplete-jedi'
    Plugin 'klen/python-mode'                   " Python mode(docs, refactor, lints...)
    Plugin 'Vimjas/vim-python-pep8-indent'      " python indent
    Plugin 'williamjameshandley/vimteractive'   " python interactive terminal
"-------------------===Snippets support===--------------------
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'                 " snippets repository

"-------------------===Languages===-------------------------------
    "Plugin 'fatih/vim-go'                       " GO language
    "Plugin 'moby/moby'                          " Docker
    "Plugin 'jceb/vim-orgmode'                   " Vim-Org

"-------------------===Color schemes===-------------------------------
    Plugin 'NLKNguyen/papercolor-theme'         " PaperColor
    Plugin 'dikiaap/minimalist'
    "Plugin 'romainl/Apprentice'                 " apprentice
    "Plugin 'AlessandroYorba/Sierra'             " sierra
    "Plugin 'AlessandroYorba/Alduin'             " alduin
    "Plugin 'AlessandroYorba/Despacio'           " despacio
    Plugin 'colepeters/spacemacs-theme.vim'     " spacemacs-theme
    "Plugin 'AlessandroYorba/Breve'              " breve
    "Plugin 'AlessandroYorba/Arcadia'            " arcadia

"-------------------===Other===-------------------------------
    Plugin 'tpope/vim-surround'                 " surround;
    Plugin 'jiangmiao/auto-pairs'               " autopairing quotes,braces
    "Plugin 'preservim/nerdcommenter'            " commentor
    "Plugin 'linuxsuren/devops.vim'              " Devops
    Plugin 'itchyny/lightline.vim'              " status bar
    Plugin 'tmhedberg/SimpylFold'               " Code  Folding

" Add plugins here
call vundle#end()


nnoremap <leader>. :CtrlPTag<cr>

" Editor Color Scheme
" =======================
    if (has("termguicolors"))
        set termguicolors
    endif
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif
    set background=dark
    colorscheme spacemacs-theme "minimalist rcadia despacio PaperColor spacemacs-theme sierra

    "let g:despacio_Sunset = 1
    "let g:despacio_Twilight = 1
    "let g:despacio_Midnight = 1
    "let g:despacio_Midnight = 1

" Set extra options when running in GUI mode
"============================================

    if has("gui_running")
        set guioptions-=T
        set guioptions-=e
        set t_Co=256
        set guitablabel=%M\ %t
    endif

" GIT GUTTER
" =================
        " Use fontawesome icons as signs
        let g:gitgutter_sign_added = '+'
        let g:gitgutter_sign_modified = '>'
        let g:gitgutter_sign_removed = '-'
        let g:gitgutter_sign_removed_first_line = '^'
        let g:gitgutter_sign_modified_removed = '<'
        let g:gitgutter_override_sign_column_highlight = 1

        "highlight SignColumn guibg=bg
        "highlight SignColumn ctermbg=bg

        " Update sign column every quarter second
        set updatetime=250


" JEDI
" ===================
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#completions_command = "<C-Space>"
        let g:jedi#rename_command = "<leader>r"
        let g:jedi#popup_select_first = 0 "Jedi selects the first line of the completion menu
        let g:jedi#force_py_version = 3
        let g:jedi#completions_enabled = 1
        let g:jedi#popup_on_dot = 1
        let g:jedi#use_splits_not_buffers = "left"
        let g:jedi#smart_auto_mappings = 1
"PYMODE
"================
        let g:pymode = 1
        let g:pymode_trim_whitespaces = 1
        let g:pymode_options = 0
        let g:pymode_indent = 1
        let g:pymode_lint = 1
        let g:pymode_lint_on_write = 1
        let g:pymode_lint_checkers = ['pyflakes', 'pep8']
        let g:pymode_lint_signs = 1
        let g:pymode_lint_todo_symbol = 'WW'
        let g:pymode_lint_comment_symbol = 'CC'
        let g:pymode_lint_visual_symbol = 'RR'
        let g:pymode_lint_error_symbol = 'EE'
        let g:pymode_lint_info_symbol = 'II'
        let g:pymode_lint_pyflakes_symbol = 'FF'

        let g:pymode_rope = 1
        let g:pymode_rope_completion = 1

        let g:pymode_syntax_all = 1
        let g:pymode_syntax_indent_errors = g:pymode_syntax_all
        let g:pymode_syntax_space_errors = g:pymode_syntax_all

" CTRLP
" =======
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll)$',
          \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
          \ }
        let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
        let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_use_caching = 1
        let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
        let g:ctrlp_clear_cache_on_exit = 1
        let g:ctrlp_max_files = 10000
        let g:ctrlp_max_depth = 40
        let g:ctrlp_show_hidden = 0
        let g:ctrlp_tabpage_position = 'ac'

" VIMTERACTIVE
" ================================

        let g:vimteractive_vertical = 1        " Vertically split terminals
        let g:vimteractive_autostart = 0       " Don't start terminals by default

" ISORT
" ============================
    autocmd FileType python nnoremap <leader>s :!isort %<CR><CR>
" YAPF
" ===============
    autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
    "autocmd FileType python YapfAutoEnable
    "autocmd FileType python vnoremap <buffer><Leader>cf :Yapf<CR>
" UltiSnip settings
" ====================================================
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
"    set spell spelllang=en_us

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

" Encoding
" ===============
    set encoding=UTF-8

" Showing line number and length
" ==============================
    set number      "show number line
    set tw=79       "width of document
    set cursorline  "highlight current line
    set showcmd     " show command in bottom bar
    set wildmenu    " visual autocomplete for command menu

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
    set showmatch

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

"Always show current position
"============================
    set ruler

" Add a bit extra margin to the left
" ================================
    set foldcolumn=1
    "set foldenable          " enable folding
    "set foldmethod=indent

" NERD Tree
" =================

    " " toggle nerd tree display
    map <F3> :NERDTreeToggle<CR>
    " " don't show these file types
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
    let NERDTreeWinSize=20
    "autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments

"Copy and Paste from + register
"===============================
    vnoremap <C-c> "+y
    map <C-b> "+p <Enter>


" Key Mapping
" ==============
"
    map <C-a> GVgg
    map <C-o> :vs . <Enter>
    map <leader>t :vert term <Enter>
    map <C-i> >>
    map <C-j> <<
