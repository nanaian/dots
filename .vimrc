" tabs
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
inoremap <CR> <CR>x<BS>

set viminfo=

" plugins
filetype plugin on
filetype indent on
syntax on

" disable paren matching
" note: removing this causes bugs due to `match3` below
function! g:Killmatchparen ()
	if exists(":NoMatchParen")
		:NoMatchParen
	endif
endfunction

augroup plugin_initialize
	autocmd!
	autocmd VimEnter * call Killmatchparen()
augroup END

" mouse
set mouse=a

" show leading whitespace
set list
set listchars=tab:\|\ ,space:·
highlight WhiteSpace ctermfg=8
highlight WhiteSpaceInvis ctermfg=0
match WhiteSpaceInvis / /
2match WhiteSpace /^[\t ]\+/
3match WhiteSpace /[\t ]\+$/

" ctrl keybindings
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
vmap <C-s> <Esc>:w<CR>i
vmap <C-z> <Esc>uv
map  <C-v> pi
map  <C-s> :w<CR>
map  <C-z> ui
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui
imap <C-s> <Esc>:w<CR>i
set clipboard=unnamedplus

" prevent esc from moving the cursor one char to the left
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" tab visual selection
vmap <Tab>   <C-t>
vmap <S-Tab> <C-d>

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" reread file if it is externally modified
set autoread

" disable history bindings
nnoremap q: <nop>
nnoremap Q: <nop>
set history=0

" pipe cursor in insert
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[4 q"

" show current line number only
set number
set numberwidth=3
set cursorline
highlight LineNr ctermfg=0 ctermbg=NONE
highlight CursorLineNR ctermfg=8 ctermbg=NONE
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE

" end of buffer `~` color
highlight EndOfBuffer ctermfg=0

" make backspace work as it should in visual mode
vmap <bs> d

" jump to previous position on file open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" hide ruler at bottom right
set noruler
