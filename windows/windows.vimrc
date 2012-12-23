set nocompatible

source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim

behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = ''
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  silent execute '!C:\Archivos de programa\Vim\vim72\diff -a ' . opt . '"' . v:fname_in . '" "' . v:fname_new . '" > "' . v:fname_out . '"'
endfunction

"set guifont=Bitstream_Vera_Sans_Mono:h8:cANSI
"set guioptions=rbgmt
set guifont=DejaVu_Sans_Mono:h8:cANSI
set guioptions=rgmteh
set columns=110
set lines=40
set number
set ignorecase
set bdir=C:\home\tmp,.
set ts=4
set sts=4
set sw=4
set et
set si
set nowrap
set cursorline
set cursorcolumn
set fcs=vert:\ ,fold:-

map <CR> i<CR><ESC>
map <Space> i <ESC>l
map <S-Space> i
imap <S-Space> <ESC>
map <F12> <C-w>s
map <S-F12> <C-w>v
map <C-F12> <C-w>c
map <M-F12> i

map <F5> @a
map <F6> @b
map <F7> @c
map <F8> @d

:colorscheme desert
au GUIEnter * simalt ~x
