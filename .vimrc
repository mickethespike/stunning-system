set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
Plugin 'racer-rust/vim-racer'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'pangloss/vim-javascript'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()

filetype plugin indent on
syntax on
set exrc
set secure
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set backspace=2
set relativenumber
set visualbell
set confirm
set number
set wildmenu
set ignorecase
set smartcase
set nowb
set nowrap
set noswapfile
set smarttab
set cmdheight=2
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set lazyredraw
set magic
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set noundofile

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
inoremap <F3> <esc>:NERDTreeToggle<cr>
nnoremap <F3> <esc>:NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let g:NERDTreeWinPos = "right"

let g:livepreview_previewer = 'open -a mudpdf'

let g:javascript_plugin_jsdoc = 1

let g:UltiSnipsExpandTrigger="<C-h>"

set fileencoding=utf-8  " The encoding written to file.

"---------------------------------------------------"

let mapleader = "-"

" Move line downwards.
nnoremap <leader> ddp 
" Move line upwards.
nnoremap _ dd2kp

" Delete line *smoothly*
nnoremap <leader>d dd
" Clear line *smoothly*
nnoremap <leader>c dd0

" Delete line in insert mode.
inoremap <c-d> <esc>ddi

" Uppercase word
nnoremap <c-u> viwU

" Togglecase first letter of word
nnoremap <leader>bu m`b~`` 

" 'Edit vimrc file'
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" AUTOCMDS "

" Navigate with guides thanks luke my bro
inoremap <space><tab> <esc>/<++><enter>"_c4l
vnoremap <space><tab> <esc>/<++><enter>"_c4l
map <space><tab> <esc>/<++><enter>"_c4l
inoremap ;gui <++>

augroup project
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
autocmd FileType c nnoremap <F4> :exec "clear"<enter>:make!<cr>

autocmd FileType c nnoremap <F5> :exec "clear"<enter>:!./program<cr>

"MARKDOWN -- thanks lukyboy

autocmd FileType markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa) 
autocmd FileType markdown,rmd inoremap ;n ---<Enter><Enter>
autocmd FileType markdown,rmd inoremap ;b ****<++><esc>02li

" Create file if it doesn't exist
autocmd BufNewFile * :write

" Reindent - because coolness
autocmd BufWritePre,BufRead *.htm* :normal gg=G

" Vim Racer
autocmd FileType rust nnoremap <leader>gd <Plug>(rust-doc)

" CSS
autocmd FileType css nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" AUTOCMDS - LANGS "

" JAVASCRIPT

"comment
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>o

" ABBREVIATIONS - Spelling corrections "
iabbrev dont don't
iabbrev wont won't
iabbrev im I'm

" ABBREVIATIONS - Misc "
iabbrev @@ micke@mickejohansson.info
iabbrev ccopy Copyright 2018 Michael Johansson, all rights reserved.
iabbrev nnr nnoremap
iabbrev inr inoremap
iabbrev vnr vnoremap

" to get rid of the nnoremap habit
iabbrev nnoremap - 
iabbrev inoremap - 
iabbrev vnoremap -
