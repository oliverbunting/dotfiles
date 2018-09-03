
" Check to see if the plugin manager exists. If not, get it.
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:SignatureMarkTextHLDynamic=1

" ************************************************************************
" Plug managed plugins
" ************************************************************************
"
call plug#begin('~/.vim/plugged')

" File system tree
Plug 'scrooloose/nerdtree'
" Git marker + column marks
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kshenoy/vim-signature'
" Tag bar
Plug 'majutsushi/tagbar'

" Language specific tab / space rules, shared between editors
Plug 'editorconfig/editorconfig-vim'

" Auto complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" let g:deoplete#sources#syntax#min_keyword_length = 2

" Snippet engine
Plug 'Shougo/neosnippet.vim'

" More snippets
Plug 'Shougo/neosnippet-snippets'

" Language server
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" -> which uses language servers to aid completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-8.2', '--lsp', '-d', '-l', '/home/ollie/hie.log'],
    \ }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = '/home/ollie/.vim/plugged/LanguageClient-neovim/settings.json'
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']


" Fuzzy finder thing
" Plug 'Shougo/denite.nvim'
" fzf selection lists
" Plug 'junegunn/fzf'
" syntax checking
" Plug 'vim-syntastic/syntastic'

" Text alignment
" Plug 'junegunn/vim-easy-align'

" Nix support
Plug 'LnL7/vim-nix'

" Haskell stuff
"Plug 'enomsg/vim-haskellConcealPlus'
"Plug 'neovimhaskell/haskell-vim'

Plug 'sjl/badwolf'

call plug#end()

" **************************************************************************
" General settings
" **************************************************************************
set nocompatible
" Required for operations modifying multiple buffers like rename.
set hidden
set updatetime=100
" line numbers
set nu
" Explicitly show commands as I type them
set showcmd
" mouse support
set mouse=a
" Gutter signs
set signcolumn=yes
" Spelling
set spell
set spell spelllang=en_gb
" Use deus color scheme
colors badwolf

" Key shortcuts
nmap <silent> <C-\> :NERDTreeToggle<CR>
" Actually maps maps <C-/> !!!!
nmap <silent> <C-_> :TagbarToggle<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" F8 highlights all words that match the one under current cursor
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Snippets
" map  <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

noremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

syntax on
filetype plugin indent on
