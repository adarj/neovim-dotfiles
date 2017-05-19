"================Keybindings================

" Escape -> j + k
"
" Move between windows -> <C-[h, j, k, l]>
"
" Next buffer -> Leader + Tab
" Previous buffer -> Leader + p
"
" Enable TagBar -> F8
"
" Highlight current line -> Leader + l
" Move to highlighted line -> ' + l
" Reset highlights -> Leader + r
"
" Toggle wrapped text -> Leader + w
"
" Open NerdTree -> Leader + m
"
" Open list of buffers -> Leader + b
" Open list of files -> Leader + n
"
" New line below current -> o
" New line above current -> O
"
" Compile Latex file -> LocalLeader + ll
" View PDF of Latex file -> LocalLeader + lv
"
" Start easymotion plugin -> Leader + Leader
"
" Git functionality:
" 	Jump to next hunk: <C-n>
" 	Open Magit buffer: :Magit
" 	Stage changes: S
" 	Commit changes: CC
"
" Navigate to function declaration -> <C-]>
"
" Comment out line(s) -> Leader + c + c
" Comment out line(s) (preserve nesting) -> Leader + c + n





"================Plugin Settings================

call plug#begin('~/.config/nvim/bundle')

Plug 'MarcWeber/vim-addon-mw-utils'						"Dependency for vim-snipmate
Plug 'tomtom/tlib_vim'									"Dependency for vim-snipmate
Plug 'Shougo/vimproc.vim', { 'do': 'make' }				"Dependency for unite

Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'									"Helper functions for editing LaTeX files
Plug 'tpope/vim-repeat'									"Improves default repeat function
Plug 'airblade/vim-gitgutter'							"Shows git diff in gutter
Plug 'Shougo/denite.nvim' 								"Buffer/file management
Plug 'jreybert/vimagit'									"Makes git workflow easier
Plug 'Lokaltog/vim-easymotion'							"Shortcut for moving around file
Plug 'tpope/vim-surround'								"Easily add surrounding pairs
Plug 'garbas/vim-snipmate'								"Textual snippets
Plug 'neomake/neomake'									"Linting and make framework
Plug 'majutsushi/tagbar'								"Shows a list of tags on the side
Plug 'ludovicchabant/vim-gutentags'						"Uses tags to assist navigation in source files
Plug 'scrooloose/nerdtree'								"Display files and folders
Plug 'jmcantrell/vim-virtualenv'						"Tools for python virtual environments


"Tab completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}		"Auto generates config files for YCM
Plug 'scrooloose/nerdcommenter'							"Comment helper
Plug 'bling/vim-airline'								"Displays info at bottom of editor

call plug#end()


let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python3'

"indentLine
let g:indentLine_color_term = 240
let g:indentLine_char = '¦'
let g:indentLine_enabled = 0

"vimtex
let g:vimtex_compiler_progname = "nvr"
let g:vimtex_view_method = "zathura"

"vim-gitgutter
let g:gitgutter_max_signs=10000

"neomake
autocmd! BufReadPost,BufWritePost * Neomake

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]

"deoplete.nvim
let g:deoplete#enable_at_startup=1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"NERDCommenter
let g:NERDSpaceDelims = 1				"Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1			"Use compact syntax for prettified multi-line comments
let g:NERDAltDelims_java = 1			"Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1			"Allow commenting and inverting empty lines
let g:NERDTrimTrailingWhitespace = 1	"Enable trimming of trailing whitespace when uncommenting

"vim-airline
set laststatus=2
set statusline=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1





"================My Settings====================

"Editor configuration
set shiftwidth=4								"Choose the number of spaces for an auto_indentation
set tabstop=4									"Tabulation space
set smartindent									"Copy indentation from previous line
set smartcase									"Become case sensitive when capital letters are used
set shiftround									"Round indent to multiple of 'shiftwidth'
set autoindent									"Align new lines with the previous line
set ignorecase									"Case insensitive searching
set bs=indent,eol,start							"Allow backspacing over everything in visual mode
set nowrap										"Do not wrap text
set hidden										"Hides buffers instead of closing them
set nohls
set clipboard=unnamedplus
set splitbelow
set splitright
set mouse=a										"Enables mouse support
set updatetime=250

"Display settings
set ruler										"Show poistion (in the statusline)
set wildmenu  									"Show the choices for autocompletion and other
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*.zip,*.tar,*.so,*/tmp/*,*/venv/*
set showmode   									"If not activated
set hlsearch   									"Highlight the searhes
set incsearch									"Search incremently (search while typing)
set showmatch   								"Matching the brackets
set number										"Displays line numbers
set numberwidth=5								"Sets the width of the number line
set cursorline 									"Highlights the active line
set invrelativenumber							"Displays relative line numbers

highlight CursorLine cterm=None ctermbg=235 ctermfg=None





"================Mappings================

"Move between split windows easier (Ctrl - [movement keys])
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","
let maplocalleader="\\"

"NERDTree
nnoremap <silent> <Leader>m :NERDTreeFocus<CR>

"Denite.vim
nnoremap <leader>n :<C-u>Denite file_rec<cr>
nnoremap <Leader>b :<C-u>Denite buffer<CR>

"Tagbar
nmap <F8> :TagbarToggle<CR>

"deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"neomake
nmap <Leader><Space>o :lopen<CR>        "open location window
nmap <Leader><Space>c :lclose<CR>       "close location window
nmap <Leader><Space>, :ll<CR>           "go to current error/warning
nmap <Leader><Space>n :lnext<CR>        "next error/warning
nmap <Leader><Space>p :lprev<CR>        "previous error/warning

"Escape key
inoremap jk <ESC>

"Switches between wrapped and not wrapped text (Leader - w)
function! SwitchWrapping()
	if &wrap
		set nowrap
	else
		set wrap linebreak nolist
	endif
endfunction
nnoremap <silent> <Leader>w :call SwitchWrapping()<cr>

"Highlights current line (Leader - h) to highlight, (' + l) to move to
"highlighted line, and (Leader - r) to reset
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader>r :match<CR>

"Escape terminal mode
tnoremap jk <C-\><C-n>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

"Enter creates new line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Swich buffers
nmap <Leader><TAB> :bnext<CR>
nmap <Leader>p :bprevious<CR>
