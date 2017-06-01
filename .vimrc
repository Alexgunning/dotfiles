set nocompatible              " required
filetype off                  " required 

" set the runtime path to include Vundle and initialize
"if has("nvim")
	"set rtp+=~/.config/nvim/bundle/Vundle.vim "else
	"set rtp+=~/.vim/bundle/Vundle.vim
"endif

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

let mapleader = "-"
inoremap jk <ESC>
vnoremap jk <ESC>
set nu
set showcmd
set wrap!

let g:ycm_server_python_interpreter = '/usr/local/bin/python'

" TODO try changing commneting to saving place go start of line text remove
" FIX the calling of the commands seems to work fine when executed from
" command line 
" might not work well woth multiple lines but be nice in normal mode
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}


nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

inoremap <C-U> <ESC>viwUea
nnoremap <C-U> <ESC>viwUe

nnoremap <leader>av :edit $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev waht what
iabbrev tehn then
iabbrev teh the


if has("nvim")
Plugin 'Shougo/deoplete.nvim'
"One of these causes startup errors
"   Plugin 'carlitux/deoplete-ternjs'
"   Plugin 'mhartington/deoplete-typescript'
call deoplete#enable()
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
"TO DISABLE AUTOCOMPLETE 
let g:deoplete#disable_auto_complete = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
 autocmd!
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
"if exists('g:plugs["tern_for_vim"]')
 "let g:tern_show_argument_hints = 'on_hold'
 "let g:tern_show_signature_in_pum = 1
 ""autocmd FileType javascript setlocal omnifunc=tern#Complete
"endif
endif

Plugin 'zchee/deoplete-jedi'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'toyamarinyon/vim-swift'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'kballard/vim-swift'
"Plugin 'keith/swift.vim'
"Plugin 'bumaociyuan/vim-swift'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/dash.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc'
Plugin 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }

Bundle "icholy/typescript-tools.git"
au BufRead,BufNewFile *.ts  setlocal filetype=typescript

"if !exists(“g:ycm_semantic_triggers”)
"let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers[‘typescript’] = [‘.’]

if !exists("g:ycm_semantic_triggers")
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"set completeopt-=preview
autocmd FileType typescript setlocal completeopt+=menu,preview

"let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescript_tsc_args = '--target ES6 --noEmit'
let g:syntastic_check_on_open = 1
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']


"let g:syntastic_always_populate_loc_list = 1

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"let g:ycm_autoclose_preview_window_after_insertion = 1
"
let g:tsuquyomi_completion_preview = 1

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_definition_split = 2


let g:dash_map = {'typescript' : 'javascript'}

"To get airline to show up without splitting
set laststatus=2

set background=dark
"set g:solarized_termcolors=256
colorscheme solarized

if has("nvim")
" Escape should exit terminal insert mode
":tnoremap <Esc><Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>

" Vterm opens a new vertically-split terminal
command! Vt vsplit | terminal
command! St split | terminal
endif

set splitbelow
set splitright

nmap j gj
nmap k gk

nnoremap <Leader>f :NERDTreeToggle<Enter>

nnoremap <leader>v :set paste!<Enter>

set mouse=r

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

set expandtab       " Expand TABs to spacesj

set hlsearch

nnoremap <leader>deb :!debug %<Enter>
nnoremap <leader>s :noh<Enter>
nnoremap <leader>num :set number!<Enter>

nnoremap <leader>def :TsuquyomiDefinition<Enter>
nnoremap <leader>sig :TsuquyomiSignatureHelp<Enter>
nnoremap <leader>ref :TsuReferences<Enter>
nnoremap <leader>er :TsuGeterr<Enter>

nnoremap <leader>qf :cclose<Enter>
nnoremap <leader>of :copen<Enter>

nnoremap <leader>p :cprevious<Enter>
nnoremap <leader>n :cnext<Enter>

nnoremap <leader>das :Dash<Enter>

map <leader>h  :wincmd H<cr>
map <leader>k  :wincmd K<cr>
map <leader>l  :wincmd L<cr>
map <leader>j  :wincmd J<cr>

nmap <left>  :3wincmd ><cr>
nmap <right> :3wincmd <<cr>
nmap <up>    :3wincmd -<cr>
nmap <down>  :3wincmd +<cr>

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Search for selected text, forwards or backwards.
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



" Highlight whitespace problems.
" flags is '' to clear highlighting, or is a string to
" specify what to highlight (one or more characters):
"   e  whitespace at end of line
"   i  spaces used for indenting
"   s  spaces before a tab
"   t  tabs not at start of line
function! ShowWhitespace(flags)
  let bad = ''
  let pat = []
  for c in split(a:flags, '\zs')
    if c == 'e'
      call add(pat, '\s\+$')
    elseif c == 'i'
      call add(pat, '^\t*\zs \+')
    elseif c == 's'
      call add(pat, ' \+\ze\t')
    elseif c == 't'
      call add(pat, '[^\t]\zs\t\+')
    else
      let bad .= c
    endif
  endfor
  if len(pat) > 0
    let s = join(pat, '\|')
    exec 'syntax match ExtraWhitespace "'.s.'" containedin=ALL'
  else
    syntax clear ExtraWhitespace
  endif
  if len(bad) > 0
    echo 'ShowWhitespace ignored: '.bad
  endif
endfunction

function! ToggleShowWhitespace()
  if !exists('b:ws_show')
    let b:ws_show = 0
  endif
  if !exists('b:ws_flags')
    let b:ws_flags = 'est'  " default (which whitespace to show)
  endif
  let b:ws_show = !b:ws_show
  if b:ws_show
    call ShowWhitespace(b:ws_flags)
  else
    call ShowWhitespace('')
  endif
endfunction

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"==============



