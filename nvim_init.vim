syntax enable
syntax on
filetype on

set background=dark
" indent width(space num)
set shiftwidth=4
" tab (space num)
set tabstop=4
set shiftround
set autoindent
set smartindent

" display line number
set number

" highlight current line
set cursorline

" highlight search
set hlsearch
set incsearch

set backup
set autowrite
set autoread

set encoding=utf8
set helplang=cn

"================================================
" Plugin
"------------------------------------------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')
	Plug 'altercation/vim-colors-solarized'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	"Plug 'majutsushi/tagbar'
	"Plug 'ycm-core/YouCompleteMe'
	Plug 'preservim/nerdtree'
call plug#end()


"================================================
" Plugin config
"------------------------------------------------
" vim-color-solarized
let g:solarized_termcolors=256
" nerdtree
map <A-1> :NERDTreeMirror<CR>
map <A-1> :NERDTreeToggle<CR>

"================================================
" Theme
"------------------------------------------------
colorscheme solarized

