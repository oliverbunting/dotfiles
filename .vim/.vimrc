
" Check to see if the plugin manager exists. If not, get it.
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug.vim managed plugins
"
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'

" tab complete search
Plug 'vim-scripts/SearchComplete' 

" sign column marks in 
Plug 'vim-scripts/ShowMarks'

" tab completion
Plug 'ervandew/supertab'

"
"
call plug#end()

" **************************************************************************
" General settings
" **************************************************************************
" line numbers
set nu

" mouse support
set mouse=a



