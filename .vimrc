" ===>>==================<<=== "
" ===>>===   BASICS   ===<<=== "
" ===>>==================<<=== " {{{
set nocompatible

set encoding=utf-8

set spell
set noshowmode
set breakindent
set textwidth=80
set signcolumn=yes
set virtualedit=block

set splitbelow
set splitright

if !has('nvim')
	set autoshelldir
endif

filetype on
filetype plugin on
filetype indent on

syntax on
syntax enable
syntax spell notoplevel
set background=dark

set number
set relativenumber

set guifont=FiraCode\ Nerd\ Font\ Regular:h11

set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set noexpandtab
set smarttab

set scrolloff=10
set nowrap

set incsearch
set ignorecase

set showbreak=↪\
set list
set listchars=eol:↲,nbsp:␣,trail:•,extends:>,precedes:<
set listchars+=tab:\ \ │

set updatetime=300
set shortmess=as

set smartcase
set showcmd
set showmatch
set hlsearch

set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set colorcolumn=80

set nocursorline
set nocursorcolumn

set mouse=a
" }}}

" ===>>==================<<=== "
" ===>>===  MAPPINGS  ===<<=== "
" ===>>==================<<=== {{{

let mapleader = ","
let maplocalleader = "\\"

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

inoremap jk <esc>

" TODO map these to something useful
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap <S-j> "iyyp

nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>so :source $MYVIMRC<cr>

function! SmartSplitText()
	let width = winwidth('%')
	let height = winheight('%')

	echo width height

	if (width > height * 4)
		return 'vsplit'
	else
		return 'split'
	endif
endfunction

nnoremap <leader>n :NERDTree<cr>

augroup NerdTree
	autocmd!
	autocmd filetype nerdtree setlocal nocursorline nocursorcolumn colorcolumn= noshowmode noruler laststatus=0 noshowcmd cmdheight=1 
augroup END

nnoremap ; :

inoremap , ,<space>

noremap ' `

inoremap <C-w> <esc><C-w>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in` :<c-u>normal! f`vi`<cr>

onoremap il( :<c-u>normal! F(vi(<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap il` :<c-u>normal! F`vi`<cr>

nnoremap <leader><space> :nohlsearch<cr>

nnoremap 9 $
onoremap 9 v$l
vnoremap 9 $

tnoremap <C-w>\| <C-w>:vert term<cr>
tnoremap <C-w>- <C-w>:term<cr>

set foldmethod=indent
set nofoldenable

augroup header
	autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^#\\+.*$\r:nohlsearch\rwv$"<cr>
	autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^#\\+.*$\r:nohlsearch\rv$"<cr>
augroup END

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup css_change_selector
	autocmd!
	autocmd FileType css :onoremap is :<c-u>execute "normal! ?^.* {$\r:nohlsearch\rvwh$"<cr>
augroup END

nnoremap <Leader>c *``cgn
nnoremap <Leader>C #``cgn

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR> "Test!!"

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <leader>r :call CompileAndRun()<cr>

function! CompileAndRun()
	call popup_notification('Building...', #{})
	let compiler = 'node'
	if &filetype ==? 'javascript'
		" We already handled that
	elseif &filetype ==? 'typescript'
		let compiler = 'ts-node'
	elseif &filetype ==? 'html'
		echom 'Maybe you wanted to open ' . expand('%:p') . '? (Path copied to clipboard)'
		let @+ = expand('%:p')
		return
	endif

	silent !clear
	execute "!" . compiler . " " . expand('%:p')
endfunction

nnoremap <leader>t :call terminal()<cr>

function! terminal()
	let split = SmartSplitText()
	if split ==? 'vsplit'
		vert term
	else
		term
	endif
endfunction

nnoremap <leader>h mtbithis.<esc>`t

nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   LOADER   ===<<=== "
" ===>>==================<<=== {{{
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'SiddharthShyniben/pitch'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/context.vim'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'kamykn/spelunker.vim'
Plug 'kevinoid/vim-jsonc'

Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown'

Plug 'PsychoLlama/vim-gol', { 'on': 'GOL' }

Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===CONFIGURATION==<<=== "
" ===>>==================<<=== {{{
let g:markdown_fenced_languages = ['html', 'css', 'js=javascript', 'javascript', 'vim', 'ts=typescript', 'yaml', 'toml']

let t_Co=256

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

colors pitch
colorscheme pitch

set foldtext=gitgutter#fold#foldtext()

let g:lightline = {
			\ 	'colorscheme': 'pitch',
			\ 	'active': {
				\ 		'left': [['mode',  'relativepath', 'paste'], ['fugitive']]
				\ 	},
				\ 	'tabline': {
					\ 		'left': [['buffers']],
					\ 		'right': [['close']]
					\ 	},
					\ 	'component_expand': {'buffers': 'lightline#bufferline#buffers'},
					\ 	'component_type': {'buffers': 'tabsel'},
					\ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
"}}}

" ===>>==================<<=== "
" ===>>===    MISC    ===<<=== "
" ===>>==================<<=== {{{

function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

if (has('termguicolors'))
	set termguicolors
endif

match Error /\s\+$/
" }}}
