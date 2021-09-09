" ===>>===   BASICS   ===<<=== "
" ===>>==================<<=== " {{{
set nocompatible

set encoding=utf-8

set spell
set noshowmode

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

set scrolloff=10
set nowrap

set incsearch
set ignorecase

set showbreak=↪\
set list
set listchars=eol:↲,nbsp:␣,trail:•,extends:>,precedes:<
set listchars+=tab:\ \ \│

set smartcase
set showcmd
set showmatch
set hlsearch

set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set colorcolumn=80

set cursorline
set cursorcolumn
" }}}

" ===>>==================<<=== "
" ===>>===  MAPPINGS  ===<<=== "
" ===>>===    AND     ===<<=== "
" ===>>===  SNIPPETS  ===<<=== "
" ===>>==================<<=== {{{

let mapleader = ","
let maplocalleader = "\\"

noremap + ddp
noremap - ddkkp

nnoremap H 0
nnoremap L $

nnoremap <BS> hx

nnoremap U gUl

inoremap jk <esc>

nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap <leader>0 0w

nnoremap du ddkpp

nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>so :source $MYVIMRC<cr>

nnoremap <leader>N :NERDTree<cr>

nnoremap ; :

inoremap , ,<space>

inoremap <C-w> <esc><C-w>

nnoremap <leader>no :set relativenumber!<cr>

" inoremap ' ''<Left>
" inoremap " ""<Left>
" inoremap ` ``<Left>
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap < <><Left>

nnoremap <leader>fmt :%s/{ \(.*\) }/{\1}/g<cr>

" if (|) => if () {|}
inoremap n{ <right><space>{}<esc>i

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>

onoremap il( :<c-u>normal! F(vi(<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>f mfgg=G''`f

nnoremap 9 $
onoremap 9 v$
vnoremap 9 $

tnoremap <C-w>\| <C-w>:vert term<cr>
tnoremap <C-w>- <C-w>:term<cr>

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

augroup leave_buffer
	autocmd!
	autocmd BufLeave mP
augroup END

augroup deno
	autocmd!
	autocmd FileType typescript :CocCommand deno.initializeWorkspace
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

" TODO: map to something better
nnoremap <C-w><Up> <nop>
nnoremap <C-w><Down> <nop>
nnoremap <C-w><Left> <nop>
nnoremap <C-w><Right> <nop>

nnoremap <leader>t :term<cr>
nnoremap <leader>T :vert term<cr>

nnoremap <leader>h mtbithis.<esc>`t

nnoremap <C-w>\| :vsplit<cr>
nnoremap <C-w>_ :split<cr>

iabbrev viod void
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
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

Plug 'gabrielelana/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'

Plug 'turbio/bracey.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'PsychoLlama/vim-gol', { 'on': 'GOL' }
Plug 'mhinz/vim-startify'

Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   CONFIG   ===<<=== "
" ===>>==================<<=== {{{
autocmd VimEnter * RainbowParentheses
autocmd VimEnter * NERDTree | wincmd p

let g:material_terminal_italics = 1
let g:material_theme_style='darker'

let t_Co=256

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

colors material
colorscheme material

let g:lightline = { 'colorscheme': 'material_vim' }
let g:airline_powerline_fonts = 1

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

" Backup
if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

if (has('termguicolors'))
	set termguicolors
endif
" }}}
