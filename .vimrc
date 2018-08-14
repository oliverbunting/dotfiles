
" Check to see if the plugin manager exists. If not, get it.
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:SignatureMarkTextHLDynamic=1

" ************************************************************************
" Plug.vim managed plugins
" ************************************************************************
"
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'

" tab complete search
Plug 'vim-scripts/SearchComplete' 

" sign column marks in 
Plug 'kshenoy/vim-signature'

" tab completion
Plug 'ervandew/supertab'

" syntax checking
"
Plug 'vim-syntastic/syntastic'

" Filesystem tree + git markers
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Text alignment
Plug 'junegunn/vim-easy-align'

" Nix support
Plug 'LnL7/vim-nix'

" Haskell stuff
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'neovimhaskell/haskell-vim'
" Color scheme
"
Plug 'sjl/badwolf'

call plug#end()

" **************************************************************************
" General settings
" **************************************************************************
set updatetime=100

" line numbers
set nu

" mouse support
set mouse=a

" Choose a color scheme
colors badwolf

syntax on
filetype plugin indent on
