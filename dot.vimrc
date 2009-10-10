" vim memo
" Diff mode で差分をマージ do, dp
"" encodingを変更して読み直し e.g. :e ++enc=utf-8
" 検索した結果が含まれる行をすべて消す
" g/hoge/d
" 検索した結果が含まれない行をすべて消す。
" v/hoge/d
" memo ここまで

if has('win32') || has('win64')
        set encoding=shift_jis 
else
        set encoding=utf-8    
endif

set ttyfast
set iminsert=0
set imsearch=0
set nocompatible
set hidden
set backspace=indent,eol,start
set ruler
set tabstop=2
set laststatus=1
set cmdheight=1
set modeline
set showcmd
set showmatch
set title
set matchpairs+=<:>
set ignorecase
set smartindent
set expandtab
set wildmenu
set hlsearch
set incsearch
set visualbell
set vb t_vb=
set errorbells
set lz
syntax on
colorscheme slate

set nowrapscan
set autoread
set autochdir

" backup directory
set backupext=.back
set backupdir=~/backup
let &directory = &backupdir

set clipboard& clipboard+=unnamed

set shortmess=aTI

set history=300

" コメント行にする。
vnoremap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
" コメント行を解除する
vnoremap ,u :s/^\/\///<CR>:nohlsearch<CR>

" Configuraitons for each languages
if has("autocmd")
        autocmd FileType c set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
        autocmd FileType java set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
        autocmd FileType cpp,sh set shiftwidth=5 softtabstop=5 tabstop=5
        autocmd FileType perl set shiftwidth=5 softtabstop=5 tabstop=5 expandtab
        autocmd FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
endif

set tags=tags;

" bind key
" insertモードはemacsっぽく
inoremap <C-B> <LEFT>
inoremap <C-F> <RIGHT>
inoremap <C-A> <HOME>
inoremap <C-E> <END>
inoremap <C-D> <DEL>
inoremap <C-P> <UP>
inoremap <C-N> <DOWN>
inoremap <C-K> <C-O>d<END>
inoremap <C-J> <C-X><C-P>
inoremap <C-Y> <C-O>p
inoremap <C-SPACE> <C-O><C-V>
inoremap <C-L> <C-O>zz

cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>
cnoremap <C-B> <LEFT>
cnoremap <C-F> <RIGHT>
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
cnoremap <C-Y> <C-R>"

noremap <C-A> <HOME>
noremap <C-E> <END>
noremap <C-P> <up>
noremap <C-B> <LEFT>
noremap <C-F> <RIGHT>
noremap <C-N> <DOWN>
noremap <C-I> :ls<CR>
noremap <C-K> d<END>
noremap <C-J> <C-A>
noremap <C-M> <C-X>
noremap <C-L> zz:nohlsearch<CR>
