" $Id: .vimrc,v 1.7 2019/04/25 18:53:25 user Exp $
"
" ~/.vimrc - VIM 7 configuration file

" Not compatible with Vi
"
set nocompatible

" GUI options
"
if has("gui")
    set guioptions+=abghr
    set guioptions-=T

    set guipty

    " set columns=80
    " set lines=50
endif

" Automatically insert comment character if we need to
"
set formatoptions+=ntcroq2

" Highlight and autocomplete search
"
set hlsearch
set incsearch

" Some automatic cursor moving
"
set autoindent
set nostartofline

" Don't make chaos on my display
"
set nowrap
set backspace=indent,eol,start
set nojoinspaces

" Some information is always good 
set showfulltag
set report=0
set shortmess-=aI
set shortmess+=T
"
set wildmenu
set laststatus=2
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]
"
set helpheight=12
set winminheight=0

" I want to see some context around
"
set scrolloff=2
set sidescrolloff=5
"
" ...and maybe even all around
"
" set scrolloff=999
set sidescroll=15


" Nice :list or :set list
"
set listchars=tab:>-,trail:.,extends:+,eol:$,precedes:+

set fillchars="vert: ,fold:-"

" Fold options
"
" set foldcolumn=4
" set columns=84
set nofoldenable

" Diff options
"
set diffopt=filler,context:3

" Always save some info for next time
"
set history=2000
set viminfo='200,h,%

" Don't save options to session file - it's possibly buggy
"
set sessionoptions-=options

" Pretty select with mouse and shifted special keys
"
behave mswin
"
" ...but not reset selection with not-shifted special keys
set keymodel-=stopsel
set selection=inclusive

" Highlight syntax
"
syntax on

filetype plugin indent on

" It's not an MS Word clone
"
set secure

set fileencodings=ucs-bom,utf-8,cp1251,default,latin1

" Color scheme
"
" All colors:  default blue  darkblue delek  desert  elflord  evening  industry  koehler  morning  murphy  pablo  peachpuff  ron  shine  slate  torte  zellner
color evening

" Python syntax options
"
let python_highlight_all = 1

" Indent commands
"
com SpaceIndent :set tabstop=4| set shiftwidth=4| set expandtab
com TabIndent :set tabstop=8| set shiftwidth=8| set noexpandtab
SpaceIndent

" Spell check
"
" setlocal spell spelllang=en
" setlocal spell spelllang=ru
"
setlocal spell spelllang=ru_ru,en_us
" setlocal spell spelllang=ru_yo,en_us
set nospell

" Alternate russian keys support
"
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Key mapping for Russian QWERTY keyboard in UTF-8
"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
