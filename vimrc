" use vim defaults
set nocompatible

""" VUNDLE
filetype off
set  rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tcomment_vim'
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
"Bundle 'UltiSnips'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on


" clear autocmds
autocmd!

""" ESSENTIAL


" fix backspace
set backspace=indent,eol,start

" syntax highlighting
syntax on

" don't beep (or flash)
set vb t_vb=

" don't wait so long for escape sequence (fix <Esc>O lag)
set ttimeoutlen=100

" or disable recognising escape sequences in insert mode
"set noesckeys

" always show status line and ruler (position)
set laststatus=2
set ruler

" automatic indentation
set autoindent

" indentation width 4, use spaces
set shiftwidth=4  " pressing tab at beginning of line (and < > cmds)
set softtabstop=4  " pressing tab inside line
set expandtab
set smarttab

" don't mess with existing indentation
set copyindent
set preserveindent

" switch between modified buffers without saving
set hidden


""" OTHER

" english messages
"language messages en_US.UTF-8

" wrap and break lines at end of word
set nowrap
set linebreak

" characters for showing long lines, trailing spaces, tabs
" (use :set list!)
set listchars=extends:>,precedes:<,trail:.,tab:>-

" enable mouse
set mouse=a

" line numbers
set number
set numberwidth=4

" show incomplete commands on screen
set showcmd

" show menu for tab completing commands
set wildmenu
"set wildignorecase

" command-line history
set history=100

" path for :find etc.
"set path+=~/code/**,~/bin/,~/.vim/**

" files to ignore when TABing
set wildignore+=*.o,*.class,*.pyc,*.hi

" directory for swap and backup files
" (double slash makes sure filenames are unique)
set directory^=~/.vim/_backup//
set backupdir^=~/.vim/_backup//

" persistent undo
set undodir=~/.vim/_undo
set undofile
set undolevels=10000  " max number of changes that can be undone
set undoreload=10000  " max number lines to save for undo on a buffer reload

" don't force swap file to be synced to disk after writing
" this prevents dropbox from logging edit as 'delete + add'
" ('set noswapfile' also works)
set swapsync=

" no filler characters in window seperators, folded lines
set fillchars=

" don't redraw while running macros
"set lazyredraw

set shiftround " round spaces to nearest shiftwidth multiple (for > and <)
set nojoinspaces " don't insert 2 spaces when joining on '.', '?' and '!'

" indentation width 4, use tabs
"set shiftwidth=4
"set tabstop=4

" completion
"set completeopt+=menuone  " nice as a function tooltip
set ofu=syntaxcomplete#Complete

" indentation folding
set foldmethod=indent
"set foldlevel=99
set nofoldenable

" minimal num of lines above and below cursor when scrolling
set scrolloff=2

" vertical diffsplit
set diffopt+=vertical

" unicode encoding
set encoding=utf-8
set fileencoding=utf-8

set fileencodings=ucs-bom,utf-8,default,cp1250

" make searches case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase

" jump to search results as you type
set incsearch

" use * clipboard as default
"set clipboard^=unnamed

" colorscheme
if &term == "linux"
    colorscheme less
elseif &t_Co == 256
    colorscheme xoria256
else
    colorscheme my_black
endif


""" FILETYPE & AUTOCMDS

" detect .tex as latex
let g:tex_flavor = "latex"
let g:tex_conceal = ""
let g:tex_fold_enabled = 1
let g:tex_indent_items = 0

autocmd FileType tex setlocal textwidth=72 foldmethod=syntax
"autocmd FileType tex setlocal formatoptions+=a

" latex compiling
"autocmd FileType tex setlocal makeprg=rubber\ -dfsq\ % errorformat=%f:%l:\ %m

" indentation exceptions
" use tabs for web code
autocmd FileType html,css,php,javascript setlocal noexpandtab tabstop=4

" python recommended formating
"autocmd FileType python setlocal ts=8 sw=4 sts=4 et sta "tw=79

" python syntax settings
let python_highlight_numbers = 1
"let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" source .vimrc after saving
autocmd BufWritePost $MYVIMRC source $MYVIMRC


""" MAPPINGS & COMMANDS

" space as mapleader
map <space> <nop>
let mapleader = ' '

" switch case of last word
imap <c-j> <Esc>bg~iwea

" vimrc access
nmap <silent> <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" toggle wrap
nmap <silent> <leader>w :set wrap!<CR>:set nowrap?<CR>

nmap <silent> <c-k> :CtrlPBufTag<CR>

" cd to directory containing current file
nmap <silent> <leader>cd :lcd %:h<cr> :pwd<cr>

map <silent> <leader>m :update<CR>:silent make<CR><C-L>

" switch windows
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" move windows
noremap <silent> <leader>H :wincmd H<CR>
noremap <silent> <leader>J :wincmd J<CR>
noremap <silent> <leader>K :wincmd K<CR>
noremap <silent> <leader>L :wincmd L<CR>

" close windows
noremap <silent> <leader>c :wincmd c<CR>
noremap <silent> <leader>o :wincmd o<CR>

" swap words
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

command! Sudow w !sudo tee % >/dev/null

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" replace selection with default register
vnoremap P "_dP

" emacs-style shortcuts in cmd line
cnoremap <C-A> <Home>
"cnoremap <C-F> <Right>
"cnoremap <C-B> <Left>

" tip #38 - movement by visible lines
"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk
"vnoremap <Down> gj
"vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

"function! SyntaxItem()
"  return synIDattr(synID(line("."),col("."),1),"name")
"endfunction
"
"set statusline+=%{SyntaxItem()}                

imap <silent> <C-l> <C-o>:call g:indent_to()<CR>
function! g:indent_to()
    let char = getchar()
    if char == 27 " escape
        return
    endif
    let pos = match(getline(line('.') - 1), nr2char(char))
    call setline(line('.'), repeat(' ', pos) . getline('.'))
    call cursor(line('.'), pos)
endfunction


""" PLUGINS
let g:tcomment_types = { 'c': '// %s' }

" use current working directory for ctrl-p
let g:ctrlp_working_path_mode = 0


""" GUI

if has("gui_running")
    " t_vb gets reset by the gui...
    au GUIEnter * set t_vb=

    " no menu, toolbar, scrollbar, popups
    set guioptions=ac

    " geometry
    set lines=30
    set columns=85

    " turn off blinking cursor
    let &guicursor = &guicursor . ",a:blinkon0"

    " font
    if has('win32')
        " windows font
        set guifont=Courier_New:h10
    else
        " linux font
        set guifont=DejaVu\ Sans\ Mono\ 12
        "set guifont=Liberation\ Mono\ 11
        "set guifont=Monaco\ 11
    endif

    " colorscheme
    "colorscheme xoria256
    colorscheme mac_classic
endif
