" ===>>===   BASICS   ===<<=== "
" ===>>==================<<=== " {{{
" Disable vi compatibility
set nocompatible

" Spell stuff
set spell

" Don't show the mode (doesn't work), dunno why
set noshowmode

" Enable file type detection
filetype on

" Automatically change terminal working directory
set autoshelldir

" Load plugins for detected file
filetype plugin on

" Load an indent file for the file type
filetype indent on

" Syntax highlighting
syntax on
set background=dark


" Relatively add numbers to each line on the left-hand side.
set number
set relativenumber

set cursorline
set cursorcolumn

" Set font
set guifont=FiraCode-Regular:h11

" Indent configuration
set autoindent
set shiftwidth=2
set tabstop=2
set noexpandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as
" you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" List
set list

" Listchars
set listchars=eol:$,tab:<->,lead:•,trail:•

" Override the `ignorecase` option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make `wildmenu` behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Folding stuff
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Set a ruler at 80
let &colorcolumn="80,".join(range(120,999),",")

" Highlight cursor line and column
set cursorline
set cursorcolumn

" Set font
set guifont=FiraCode-Regular:h11

" Indent configuration
set autoindent
set shiftwidth=2
set tabstop=2
set noexpandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as
" you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" List
set list

" Listchars
set listchars=eol:$,tab:<->,lead:•,trail:•

" Override the `ignorecase` option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make `wildmenu` behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Folding stuff
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Set a ruler at 80
let &colorcolumn="80,".join(range(120,999),",")

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" }}}

" ===>>==================<<=== "
" ===>>===  MAPPINGS  ===<<=== "
" ===>>===    AND     ===<<=== "
" ===>>===  SNIPPETS  ===<<=== "
" ===>>==================<<=== {{{

let mapleader = ","
let maplocalleader = "\\"

" Move lines
noremap + ddp
noremap - ddkkp

" "Strong" HL
nnoremap H 0
nnoremap L $

" Backspace in normal
nnoremap <BS> hx

" That escape too far away
inoremap jk <esc>
" Sometimes I hit the wrong keys
inoremap kl <esc>
" Just mash any two keys together
inoremap kj <esc>
" Force myself to use jk (not needed because I barely use <esc>)
" inoremap <esc> <nop>

" Force myself to use hjkl to navigate
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Duplicate line
nnoremap du ddkpp

" Make it easier to make it easier to edit text
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>so :source $MYVIMRC<cr>

" Toggle NERDTree
nnoremap <leader>N :NERDTree<cr>

" Why modify?
nnoremap ; :

" Pesky ctrl + w
inoremap <C-w> <esc><C-w>
" Mapping to toggle relative number
inoremap <leader>no :set relativenumber!<cr>

" Comment out
augroup comment
	autocmd!
	autocmd FileType javascript,css nnoremap gcc I/*<space><esc>A<space>*/<esc>
	autocmd FileType html           nnoremap gcc I<!--<space><esc>A<space>--><esc>
	autocmd FileType vim            nnoremap gcc I"<space><esc>A<esc>
augroup END

" More snippets
augroup comment
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> if if ()<esc>i
	autocmd FileType javascript :iabbrev <buffer> fn function<space><space>()<space>{}<esc>5h
augroup END

" Insert double chars
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>

" Format JavaScript bracket style, ie. { stuff } => {stuff}
nnoremap <leader>fmt :%s/{ \(.*\) }/{\1}/g<cr>

" Insert curly braces
" if (|) => if () {|}
inoremap n{ <right><space>{}<esc>i

" Change in next (), {}, '' or ""
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>

" Change in prev (), {}, '' or ""
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

" Remove search highlights
nnoremap <leader><space> :nohlsearch<cr>

" Format
nnoremap <leader>f mfgg=G''`f

" End of line – similar to 0 for start of line
nnoremap 9 $
" Operator complete whatever binding
onoremap 9 v$

augroup header
	" Change in header
	autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^#\\+.*$\r:nohlsearch\rwv$"<cr>
	" Change around header
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

" Leave a mark when leaving buffer"
augroup leave_buffer
	autocmd!
	autocmd BufLeave mP
augroup END

augroup deno
	autocmd!
	autocmd FileType typescript :CocCommand deno.initializeWorkspacett
augroup END

" Replace current wordish
nnoremap <Leader>x *``cgn

" Save
nnoremap ;; :w<CR>

" Run a macro on all selected lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Append to end
nnoremap <expr> <leader><leader> "mqA" . (nr2char(getchar())) . "<esc>`q"

" Append to start"
nnoremap <expr> <leader><localleader> "mq^" . (nr2char(getchar())) . "<esc>`q"

" No arrow keys!
nnoremap <C-w><Up> <nop>
nnoremap <C-w><Down> <nop>
nnoremap <C-w><Left> <nop>
nnoremap <C-w><Right> <nop>

" Terminal open
nnoremap <leader>t :term<cr>
nnoremap <leader>T :vert term<cr>

" I always forget `this`
nnoremap <leader>h mtbithis.<esc>`t

" Splits
" Idea: <C-w> to split, <C-s> to resize
"

" tmux like split mapping
nnoremap <C-w>\| :vsplit<cr>
nnoremap <C-w>_ :split<cr>

" Resize splits
nnoremap <C-s>+ <C-w>+
nnoremap <C-s>- <C-w>-
" < to resize > and > to resize <? no thank you
nnoremap <C-s>> <C-w><
nnoremap <C-s>< <C-w>>
nnoremap <C-s>= <C-w>=
" Practically hide the current split
nnoremap <C-s>h <C-w>h <C-w>|
nnoremap <C-s>j <C-w>j <C-w>_
nnoremap <C-s>k <C-w>k <C-w>_
nnoremap <C-s>l <C-w>l <C-w>|

" Typos
iabbrev viod void
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   LOADER   ===<<=== "
" ===>>==================<<=== {{{
call plug#begin('~/.vim/plugged')

" Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'turbio/bracey.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'PsychoLlama/vim-gol', { 'on': 'GOL' }

call plug#end()
" }}}

" ===>>==================<<=== "
" ===>>===   PLUGIN   ===<<=== "
" ===>>===   CONFIG   ===<<=== "
" ===>>==================<<=== {{{

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Material theme config
" let g:material_terminal_italics = 1
let g:material_theme_style='darker'
colors material
colorscheme material

" Lightline material
let g:lightline = { 'colorscheme': 'material_vim' }

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

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
	set termguicolors
endif

" Fix italics in iterm
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red

" Remove trailing spaces
augroup trailing
	autocmd!
	autocmd BufWritePre * :%s/\s\+$//e
augroup END
" }}}
