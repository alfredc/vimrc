" .vimrc

set nocompatible	        " Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			              " always set autoindenting on
"set backup               " keep a backup file
set viminfo='20,\"50	    " read/write a .viminfo file, don't store more
			                    " than 50 lines of registers
set history=50		        " keep 50 lines of command line history
set ruler		              " show the cursor position all the time

" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions-=c

" Get that filetype stuff happening
filetype on
filetype plugin on
"filetype indent on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number         " show line numbers


" Turn on that syntax highlighting
syntax on
set hlsearch

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  
  " When editing a file, always jump to the last cursor position
  "autocmd BufReadPost *
  "\ if line("'\"") > 0 && line ("'\"") <= line("$") |
  "\   exe "normal! g'\"" |
  "\ endif
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif
