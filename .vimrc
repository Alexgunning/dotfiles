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
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer --system-libclang --tern-completer'}
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'yssl/QFEnter'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sjl/gundo.vim'
Plug 'mxw/vim-jsx'
call plug#end()
let g:plug_timeout=900

let g:ycm_server_python_interpreter = '/usr/local/bin/python'

"Display the undo tree with <leader>u.
nnoremap <leader>u :GundoToggle<CR>

"Add this line if you are using Python 3.
let g:gundo_prefer_python3 = 1

"map leader command
let mapleader = "-"

"remap jk to escape for insert and visual mode
inoremap jk <ESC>
" vnoremap jk <ESC>

cnoremap checkout :!git checkout -- %


set showcmd
set wrap
set list

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
"set g:solarized_termcolors=256
colorscheme one

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

nnoremap <leader>c :let @+=@0<cr>



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

let g:jsx_ext_required = 0

let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_definition_split = 2

let g:dash_map = {'typescript' : ['typescript', 'javascript', 'mongodb', 'express', 'mocha']}

let g:ctrlp_custom_ignore = { 'dir':  'build\|node_modules$' }

"Use vim surround to use * as a way to do do c style comments
let g:surround_42 = "/* \r */"
let g:surround_36 = "${\r}"

"To get airline to show up without splitting
set laststatus=2

command! Checkout !git checkout -- %
"TODO make only current window have read only copy of file
command! Read view %


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

"Disables mouse support but allows copying
set mouse=r

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

"HTML mapping open html in different web browsers
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

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

nnoremap <leader>deb :!debug %<Enter>
nnoremap <leader>s :noh<Enter>
" nnoremap <leader>num :set number!<Enter>

"Typescript mappings
if has("nvim")
"Tsuqyuomi commands need to be duplicated to work in neovim"
  autocmd FileType typescript nnoremap <leader>d :TsuquyomiDefinition<Enter>:TsuquyomiDefinition<Enter>
  autocmd FileType typescript nnoremap <leader>td :TsuquyomiTypeDefinition<Enter>:TsuquyomiTypeDefinition<Enter>
  autocmd FileType typescript nnoremap <leader>ren :TsuquyomiRenameSymbol<Enter>:TsuquyomiRenameSymbol<Enter>
  autocmd FileType typescript nnoremap <leader>sig :TsuquyomiSignatureHelp<Enter>:TsuquyomiSignatureHelp<Enter>
  autocmd FileType typescript nnoremap <leader>r :TsuReferences<Enter>:TsuReferences<Enter>
  autocmd FileType typescript nnoremap <leader>er :TsuGeterr<Enter>:TsuGeterr<Enter>
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>:<C-u>echo tsuquyomi#hint()<CR>
else
  autocmd FileType typescript nnoremap <leader>d :TsuquyomiDefinition<Enter>
  autocmd FileType typescript nnoremap <leader>td :TsuquyomiTypeDefinition<Enter>
  autocmd FileType typescript nnoremap <leader>ren :TsuquyomiRenameSymbol<Enter>
  autocmd FileType typescript nnoremap <leader>sig :TsuquyomiSignatureHelp<Enter>
  autocmd FileType typescript nnoremap <leader>r :TsuReferences<Enter>
  autocmd FileType typescript nnoremap <leader>er :TsuGeterr<Enter>
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
endif

"Javascript tern def mappings
autocmd FileType javascript nnoremap <leader>d :TernDef<Enter>
autocmd FileType javascript nnoremap <leader>doc :TernDoc<Enter>
autocmd FileType javascript nnoremap <leader>td :TernType<Enter>
autocmd FileType javascript nnoremap <leader>r :TernRefs<Enter>
autocmd FileType javascript nnoremap <leader>ren :TernRename<Enter>

"TODO REMOVE
"easily open close quickfix menu
nnoremap <leader>qf :cclose<Enter>
"use :ccl intead
nnoremap <leader>of :copen<Enter>
"use :ccope intead
"easily close scratch menu
nnoremap <leader>pf :pclose<Enter>
"use :pc intead

nnoremap <leader>p :cprevious<Enter>
nnoremap <leader>n :cnext<Enter>

nnoremap <leader>das :Dash<Enter>

"Move windows around screen
map <leader>h  :wincmd H<cr>
map <leader>k  :wincmd K<cr>
map <leader>l  :wincmd L<cr>
map <leader>j  :wincmd J<cr>

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

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

