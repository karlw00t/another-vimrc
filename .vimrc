" add line numbers to the file
set number

set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set cinkeys=0{0}:0#!!^F

set ignorecase
set smartcase 

" Does not allow the cursor to go to the bottom of the screen
set scrolloff=4

" Mapping to get you off the arrow keys, should use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" keep you hands on the home row
inoremap jj <ESC>

" conditionally set relative numbers, added in 7.3
if has("relativenumber")
	set relativenumber
endif

" pretty color
colorscheme darkblue

"no shift to enter into command mode
nnoremap ; :

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (;      ();<Left><Left>
inoremap (<CR> 	(<CR>)<Esc>O
inoremap (;<CR> 	(<CR>);<Esc>O
inoremap ((     (
inoremap ()     ()

" turn on backup
set backup

" Set where to store backups

" Set where to store swap files

" Highlight when searching
highlight Search term=reverse ctermbg=2 ctermfg=4 guibg=Gray

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Crap, please ignore
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

if has("win32")
    behave mswin
endif

let mapleader = ","

nnoremap <leader>l $a;<Esc>

inoremap <leader>pr require_once('PHPUnit/root_path.inc.php');

call pathogen#runtime_append_all_bundles() 

function RunTest(arg)
	echo 'Running unit test ...' 
	let file = substitute(expand("%:t"), "^.", "\\U\\0", "")
	let file =  expand("%:p:h") . "/test/test" . file
	if a:arg == '-'
		let arg = ''
	endif
	if filereadable(file)
		let sp = conque_term#open('phpunit ' .a:arg. ' ' . file , ['split', 'resize 10'])
	else
		let sp = conque_term#open('phpunit ' .a:arg. ' ' . expand('%')  , ['split', 'resize 10'])
	endif
endfunction

command! -nargs=+ -complete=command Phpunit call RunTest(<q-args>)
