" add line numbers to the file
set number

" Sane programming
set cindent
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set ctags=./tags;

" makes searching more greedy
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

" Moving up and down on wrapped lines acts normal
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

" Highlight when searching
highlight Search term=reverse ctermbg=2 ctermfg=4 guibg=Gray

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Make the editor yell at you if you have a line that is longer than 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"Visual bell, so the wife doesn't get made
set vb

" Crap, please ignore the rest
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

" Pathogen calls to get it running
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

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
