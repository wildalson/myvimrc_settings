"set runtimepath+=~/.vim_runtime

"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim

"try
"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

execute pathogen#infect()
call pathogen#helptags()
" Maintainer: Wilson Daito Co
" Modified Date: 09/02/2015
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin indent on
""Mapping leader and local leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let @a = "hello"
let mapleader = "-"
let maplocalleader = "//"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Edit my vimrc 
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Mapping Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":autocmd BufNewFile * :write
":autocmd BufNewFile,BufRead *.html setlocal nowrap
":autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
nnoremap -d dd
inoremap <esc> <nop>
map <c-u> dd
nnoremap <leader>' viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>; viw<esc>a'<esc>hbi'<esc>lel
iabbrev @@ wildalson123@hotmail.com
inoremap jk <esc>
onoremap p i(
onoremap b /return<cr>
" Switching windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <leader><tab> <c-w>h
map <tab><leader> <c-w>l
map <leader>= <c-w>_
" Window Resizing
map <leader>0 :resize 20<cr>
"Select All
map <c-a> ggVG
map <C-n> :NERDTreeToggle<CR>
map <space> :noh<cr>
nnoremap <leader>c v$hda
nnoremap <leader>d v$hd
nmap B _
inoremap <A-q> ()<esc>i
inoremap <A-w> []<esc>i
inoremap <A-e> {}<esc>i
inoremap <A-r> {<esc>o}<esc>O
inoremap <A-1> ''<esc>i
inoremap <A-2> ""<esc>i
inoremap <A-3> <><esc>i
"grep settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<nop> no operation
set nobackup
set nowb
set swapfile
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" color settings

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set columns=175 " full width
set lines =53 " full height
set equalalways
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif
" Only do this part when compiled with support for autocommands.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
noremap <leader>p :CtrlPDir 
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " NerdTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  
  " Folding 
  augroup filetype_vim
	  autocmd!
	  autocmd FileType vim setlocal foldmethod=marker
  augroup END
  augroup vimrcEx
  au!
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType python :iabbrev <buffer> iff if:<left>
  autocmd FileType javascript :iabbrev <buffer> iff if()<left>
  autocmd FileType nerdtree nnoremap <buffer> <leader>b :Bookmark<space>
  "autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>c I/*<esc>$a*/<esc>
  "autocmd BufNewFile,BufRead *.html nnoremap <buffer> <localleader>c I<!--<esc>$a--><esc>
  " Put these in an autocmd group, so that we can delete them easily.
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set hlsearch
set incsearch " Do incremental searching

colors wombat256
"let NERDTreeShowBookmarks=1
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
