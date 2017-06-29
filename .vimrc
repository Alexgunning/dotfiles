"vim-plug setup
if has("nvim")
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc',  { 'do' : 'make -f make_mac.mak' } 
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer --system-libclang'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'yssl/QFEnter'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()
let g:plug_timeout=900

let g:ycm_server_python_interpreter = '/usr/local/bin/python'

"map leader command
let mapleader = "-"

"remap jk to escape for insert and visual mode
inoremap jk <ESC>
vnoremap jk <ESC>


set number
set showcmd
set wrap
set list

"Navigate windows faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"Edit/Source vimrc
nnoremap <leader>av :edit $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Common misspellings
iabbrev waht what
iabbrev tehn then
iabbrev teh the

"Bundle "icholy/typescript-tools.git"
au BufRead,BufNewFile *.ts  setlocal filetype=typescript

if !exists("g:ycm_semantic_triggers")
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

autocmd FileType typescript setlocal completeopt+=menu,preview

let g:syntastic_aggregate_errors = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_typescript_tsc_args = '--target ES6 --noEmit'
let g:syntastic_check_on_open = 1
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']


let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:tsuquyomi_completion_preview = 1

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_definition_split = 2

let g:dash_map = {'typescript' : ['typescript', 'javascript', 'mongodb', 'express', 'mocha']}

let g:ctrlp_custom_ignore = { 'dir':  'build\|node_modules$' }

"To get airline to show up without splitting
set laststatus=2

set background=dark
"set g:solarized_termcolors=256
colorscheme solarized


if has("nvim")
" Escape should exit terminal insert mode
:tnoremap jk <C-\><C-n>

" Vterm opens a new vertically-split terminal
command! Vt vsplit | terminal
command! St split | terminal
endif

set splitbelow
set splitright

"Navigate over wrapped lines
nmap j gj
nmap k gk

"Toggle NERDTree opening
nnoremap <Leader>f :NERDTreeToggle<Enter>

"Set mode to paste mode
nnoremap <leader>v :set paste!<Enter>

"Use mouse 
set mouse=a

"Basic emacs keybindings for command mode
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

"Open file in VsCode
"TODO try and figure out how to open on specfic line
command! Code execute '!code -g %:' . line('.')

"HTML mapping 
nnoremap <F12>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F12>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>s :exe ':silent !open /Applications/Safari.app %'<CR>

set wrap
set linebreak
set nolist  " list disables linebreak

set tabstop=2       " The width of a TAB is set to 2.
                " Still it is a \t. It is just that
                " Vim will interpret it to be having
                " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set hlsearch

nnoremap <leader>deb :!debug %<Enter>
nnoremap <leader>s :noh<Enter>
nnoremap <leader>num :set number!<Enter>

if has("nvim")
"Tsuqyuomi commands need to be duplicated to work in neovim"
  nnoremap <leader>def :TsuquyomiDefinition<Enter>:TsuquyomiDefinition<Enter>
  nnoremap <leader>sig :TsuquyomiSignatureHelp<Enter>:TsuquyomiSignatureHelp<Enter>
  nnoremap <leader>ref :TsuReferences<Enter>:TsuReferences<Enter>
  nnoremap <leader>er :TsuGeterr<Enter>:TsuGeterr<Enter>
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>:<C-u>echo tsuquyomi#hint()<CR>
else
  nnoremap <leader>def :TsuquyomiDefinition<Enter>
  nnoremap <leader>sig :TsuquyomiSignatureHelp<Enter>
  nnoremap <leader>ref :TsuReferences<Enter>
  nnoremap <leader>er :TsuGeterr<Enter>
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
endif

"easily open close quickfix menu
nnoremap <leader>qf :cclose<Enter>
nnoremap <leader>of :copen<Enter>

nnoremap <leader>p :cprevious<Enter>
nnoremap <leader>n :cnext<Enter>

nnoremap <leader>das :Dash<Enter>

"Move windows around screen 
map <leader>h  :wincmd H<cr>
map <leader>k  :wincmd K<cr>
map <leader>l  :wincmd L<cr>
map <leader>j  :wincmd J<cr>

nmap <left>  :3wincmd ><cr>
nmap <right> :3wincmd <<cr>
nmap <up>    :3wincmd -<cr>
nmap <down>  :3wincmd +<cr>

iabbrev mk //alex mark
command! Code !code %


autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd QuickFixCmdPost *grep* cwindow
let g:EasyGrepOpenWindowOnMatch=0
cabbrev grep grep!
cabbrev Ggrep Ggrep!
cabbrev gp Ggrep!
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Search for selected text, forwards or backwards.
" Allows * to work for highlighted text
vnoremap <silent> * :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy/<C-R><C-R>=substitute(
\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy?<C-R><C-R>=substitute(
\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>

