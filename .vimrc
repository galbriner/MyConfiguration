" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Aug 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
" Gal
set incsearch		" do incremental searching
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set autoread

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
"set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" use ; for <Leader>
let mapleader = ";"

""""""""""""""""""""""""""""""""""""""""
"" Taglist-specific settings.
""""""""""""""""""""""""""""""""""""""""

let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_SingleClick = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

" ctags plugin
let g:ctags_path='/usr/bin/ctags'
let generate_tags=1
let g:ctags_statusline=1

" ctags for Qt4,Open GL,STL, and myth
" before adding these lines create the directory ~/.vim/tags/
" cd to that directory and run the following commands
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
" --language-force=C++ -f gl /usr/include/GL/
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
"  --language-force=C++ -f cpp /usr/include/c++
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
"  --language-force=C++ -f qt4 /usr/include/qt4/
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
"  --language-force=C++ -f mythplugins /home/galb/mythtv/mythplugins/
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
"  --language-force=C++ -f mythtv /home/galb/mythtv/mythtv/
set tags+=~/.vim/tags/mythtv
set tags+=~/.vim/tags/mythplugins
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/cpp

"bind the key for omnicomplete to CTRL-X CTRL-O
filetype on
filetype plugin on
set nocp
"as an alternative to keybinding above, the commands below
"will cause the omnicomplete to activate automatically
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
" this setting will open list of option after :: (e.g. QString::), in addition
" to . and ->
let OmniCpp_MayCompleteScope = 1

" this function will open qt help on firefox
" Note: package qt4-doc-html must be install, in order to this function to work
function! QtClassDoc()
	let qt_dir = "/usr/share/qt4/doc/html/"
	let class = tolower(expand("<cword>"))
	silent execute "!/usr/bin/firefox " . qt_dir . class . ".html &>/dev/null" . " &" | redraw!
endfunction
" bind CTRL-H to the function
nmap <silent> <C-h> <Esc>:call QtClassDoc()<CR>

" keybindings
"map <Leader>T :Tlist<CR>
"map <Leader>N :NERDTree<CR>
map <Leader>t :TlistToggle<CR>
map <Leader>d :NERDTreeToggle<CR>

"
