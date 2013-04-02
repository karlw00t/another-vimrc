" add line numbers to the file
set number

" Sane programming
set cindent
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set tags=./tags;

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

"use pylint as make program for python
autocmd Filetype python set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
autocmd Filetype python set errorformat=%f:%l:\ %m

if has("win32")
    behave mswin
endif

let mapleader = ","

" Pathogen calls to get it running
call pathogen#incubate()
call pathogen#helptags()

" NerdTree
let NERDTreeIgnore = ['\.pyc$','\~$']
