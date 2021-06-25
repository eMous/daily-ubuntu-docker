" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'lifepillar/vim-solarized8'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()
" Put your non-Plugin stuff after thi lin
inoremap <expr> <Tab>   pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-.> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
""" easy motion
nmap ss <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
""""""""""""""""""""""""""""""""""""""
""" Key mappings
""""""""""""""""""""""""""""""""""""""
noremap <C-X> :wq!<CR>
noremap <C-Q> :q!<CR>
noremap ; :
noremap : <nop>

inoremap jk <ESC>
inoremap <C-Q> <ESC>:q!<CR>
inoremap <C-X> <ESC>:wq!<CR>
set timeoutlen=300
" Ignore keys
inoremap <up> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
nnoremap <right> <nop>
inoremap <ESC> <nop>
nnoremap <ESC> <nop>
"" Fix Tmux Ctrl-Arrow is free to bind
" Ctrl-Left
map <esc>[1;5D <nop>
map! <esc>[1;5D <nop>
" Ctrl-Right
map <esc>[1;5C <nop>
map! <esc>[1;5C <nop>
" Ctrl-Up
map <esc>[1;5A <C-Up>
imap <esc>[1;5A <nop>
map! <esc>[1;5A <nop>
" Ctrl-Down
map <esc>[1;5B <C-Down>
imap <esc>[1;5B <nop>
map! <esc>[1;5B <nop>
" Fix issues raised by disabling arrow keys with Tmux enironment
map <Esc>[A <nop>
map <Esc>[B <nop>
map <Esc>[C <nop>
map <Esc>[D <nop>
" Scroll Page
noremap <C-K> }
noremap <C-J> {
noremap <C-H> :help 

""""""""""""""""""""""""""""""""""""""
""" Tab setting
""""""""""""""""""""""""""""""""""""""
set ts=5 sts=8 sw=5
set rtp+=/usr/local/opt/fzf
set nu rnu 

""""""""""""""""""""""""""""""""""""""
""" Color and theme
""""""""""""""""""""""""""""""""""""""
"if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set background=dark
  " let g:solarized_contrast = "high"
  " let g:solarized_termtrans = 1
  colorscheme solarized8
"endif

""""""""""""""""""""""""""""""""""""""
""" Disable the bells
""""""""""""""""""""""""""""""""""""""
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

