" my sample .vimrc config


" basic settings
set nu
set nocompatible
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=4
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
set paste
syntax on


if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"function! s:statusline_expr()
"  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"  let ro  = "%{&readonly ? '[RO] ' : ''}"
"  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"  let sep = ' %= '
"  let pos = ' %-12(%l : %c%V%) '
"  let pct = ' %P'
"
"  return pos.'[%n] %F'.pct.' %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
"endfunction
"let &statusline = s:statusline_expr()

set statusline=%l:%c::%{FugitiveStatusline()}%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \\\ %V\ %P%<%f



set modelines=2
set synmaxcol=1000
if has("gui_running")
  set lines=50 columns=150
endif
" For MacVim
set noimd
set imi=1
set ims=-1

" ctags
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif


"My custom Fn key maps
noremap <F2> :w<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TagbarToggle<CR>
noremap <F12> :%!js-beautify<CR>

colo blue

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" My plugins
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-journal'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vader.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/heytmux'
Plug 'junegunn/vim-after-object'
unlet! g:plug_url_format

" Colors
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'yuttie/hydrangea-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/cosmic_latte'
Plug 'ayu-theme/ayu-vim'
Plug 'haishanh/night-owl.vim'


" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'sgur/vim-editorconfig'
if exists('##TextYankPost')
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 100
endif

Plug 'jistr/vim-nerdtree-tabs'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'shawncplus/phpcomplete.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/Sass'
Plug 'othree/html5.vim'
Plug 'jwalton512/vim-blade'
Plug 'sheerun/vim-polyglot'
Plug 'phpactor/phpactor'
Plug 'pangloss/vim-javascript'
Plug 'galooshi/vim-import-js'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1



 function! BuildYCM(info)
   if a:info.status == 'installed' || a:info.force
     !./install.py --clang-completer --gocode-completer --ts-completer 
   endif
 endfunction
 Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. You need to change this to something else than <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




" Browsing
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
endif
Plug 'justinmk/vim-gtfo'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
if v:version >= 703
  Plug 'mhinz/vim-signify'
endif

" Lang
"if v:version >= 703
"  Plug 'kovisoft/paredit', { 'for': 'clojure' }
"  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"  Plug 'guns/vim-clojure-static'
"  Plug 'guns/vim-clojure-highlight'
"  Plug 'guns/vim-slamhound'
"  Plug 'venantius/vim-cljfmt'
"endif
"Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'rust-lang/rust.vim'
"Plug 'tpope/vim-rails', { 'for': [] }
"Plug 'derekwyatt/vim-scala'
Plug 'honza/dockerfile.vim'
Plug 'solarnz/thrift.vim'
Plug 'dag/vim-fish'
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
"Plug 'neoclide/coc.nvim', {'release': 'branch'}

"Nginx syntax file
Plug 'chr4/nginx.vim'

" Lint
Plug 'w0rp/ale'

call plug#end()



set termguicolors
let ayucolor="mirage"
"colorscheme ayu
colorscheme night-owl

"let g:lightline =  {
"  \ "colorscheme": 'ayu_mirage',
"  \}

let g:lightline = { 'colorscheme':'nightowl'}


"let g:vue_disable_pre_processors = 1
let g:vue_pre_processors = 'detect_on_enter'
syn sync fromstart



" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

