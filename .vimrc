" ===>>==================<<=== "
" ===>>===   BASICS   ===<<=== "
" ===>>==================<<=== " {{{
set nocompatible

set encoding=utf-8

set spell
set noshowmode
set breakindent
set textwidth=80

if !has('nvim')
	set autoshelldir
endif

filetype on
filetype plugin on
filetype indent on

syntax on
syntax enable
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
set signcolumn=number

set smartcase
set showcmd
set showmatch
set hlsearch

set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set colorcolumn=80

set cursorline
set cursorcolumn

set mouse=a
" }}}

" ===>>==================<<=== "
" ===>>===  MAPPINGS  ===<<=== "
" ===>>==================<<=== {{{

let mapleader = ","
let maplocalleader = "\\"

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap U gUl
nnoremap L gul

inoremap jk <esc>

" TODO map these to something useful
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap <S-j> yyp

nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>so :source $MYVIMRC<cr>

nnoremap <leader>N :NERDTree<cr>

nnoremap ; :

inoremap , ,<space>

noremap ' `

inoremap <C-w> <esc><C-w>

" Mini formatter
function! Format()
	normal! %s/{ \(.*\) }/{\1}/g
	normal! %s/{\(.*\) }/{\1}/g
	normal! %s/{ \(.*\)}/{\1}/g
	normal! mfgg=G''`f
endfunction

nnoremap <leader>fmt :call Format()<cr>

" if (|) => if () {|}
inoremap n{ <right><space>{}<esc>i

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

augroup spell
	autocmd!
	autocmd FileType css,javascript,typescript :set nospell
augroup END

nnoremap <Leader>c *``cgn
nnoremap <Leader>C #``cgn

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR> "Test!!"

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <expr> <leader><leader> "mqA" . (nr2char(getchar())) . "<esc>`q"
nnoremap <expr> <localleader><localleader> "mq^" . (nr2char(getchar())) . "<esc>`q"

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

nnoremap <leader>t :term<cr>
nnoremap <leader>T :vert term<cr>

nnoremap <leader>h mtbithis.<esc>`t

nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

nnoremap <C-w>\| :vsplit<cr>
nnoremap <C-w>_ :split<cr>
nnoremap <C-w>o :only<cr>

" Top split (to see variables, etc.)
nnoremap <C-w>t :5vsplit %<cr>:normal! gg<cr>
nnoremap <C-w>T :5split %<cr>:normal! gg<cr>

iabbrev viod void

nnoremap tn :tabnew<cr>
nnoremap tl :tabnext<cr>
nnoremap th :tabprevious<cr>
nnoremap tc :tabclose<cr>
nnoremap to :tabonly<cr>
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   LOADER   ===<<=== "
" ===>>==================<<=== {{{
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wellle/context.vim'

Plug 'tpope/vim-surround'
Plug 'dkarter/bullets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown'
Plug 'lakshayg/vim-spell', { 'branch': 'main', 'do': { -> spell#BuildAllSyntaxFiles() } }

Plug 'PsychoLlama/vim-gol', { 'on': 'GOL' }

Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   CONFIG   ===<<=== "
" ===>>==================<<=== {{{
autocmd VimEnter * RainbowParentheses
autocmd VimEnter,TabNew * NERDTree | wincmd p

let g:material_terminal_italics = 1
let g:material_theme_style='darker'

let g:markdown_fenced_languages = ['html', 'css', 'js=javascript', 'javascript', 'vim', 'ts=typescript', 'yaml', 'toml']

let t_Co=256

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

colors material
colorscheme material

let g:lightline = {'colorscheme': 'material_vim'}

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:ale_linters = {'javascript': ['xo'], 'typescript': ['deno', 'tsserver']}
let g:ale_deno_unstable = 1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
"}}}

" ===>>==================<<=== "
" ===>>===    MISC    ===<<=== "
" ===>>==================<<=== {{{

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
