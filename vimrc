" my simple .vimrc config
" Last Update: 7 Feb 2021 
" Author: Hakuame
"



" basic settings
set nocompatible
set nu
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
set shiftwidth=4
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
set modelines=2
set synmaxcol=1000
if has("gui_running")
  set lines=50 columns=150
endif

" For MacVim
set noimd
set imi=1
set ims=-1
" end macvim
set autowrite
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
set undodir=/tmp//,.





syntax on
filetype plugin indent on


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





"My custom Fn key maps
noremap <F2> :w<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TagbarToggle<CR>
noremap <F12> :Prettier<CR>
noremap <F9> :../make<CR>

let mapleader=","
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>ws :wa<cr>:mksession!<cr>
map <leader>ls :source ~/.last_vim_session<cr>
map <F5> :tabnew<cr>
map <F6> :tabnext<cr>



if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" My plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
unlet! g:plug_url_format


" Colors
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ayu-theme/ayu-vim'
Plug 'haishanh/night-owl.vim'


" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'sgur/vim-editorconfig'
if exists('"#TextYankPost')
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 100
endif
"Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'


" html, Javascript etc
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/Sass'
Plug 'othree/html5.vim'
Plug 'jwalton512/vim-blade'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'galooshi/vim-import-js'
Plug 'ap/vim-css-color'


" Autocomplete, snippets etc
Plug 'Valloric/YouCompleteMe'
"Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }
" run this after installation
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --all
" ./install.py --clangd-completer --go-completer --rust-completer --ts-completer
" OR
" ./install.py --all
" requires xbuild, go, rust, node, npm to be installed

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }

" Nerdtree with vscode like fileicons
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'KabbAmine/vCoolor.vim'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'justinmk/vim-gtfo'

" Git
Plug 'airblade/vim-gitgutter'
""Plug 'mhinz/vim-signify'

" Go lang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }


Plug 'groenewege/vim-less'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'honza/dockerfile.vim'
Plug 'solarnz/thrift.vim'
Plug 'dag/vim-fish'
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }

"Nginx syntax file
Plug 'chr4/nginx.vim'

" Lint
Plug 'w0rp/ale'


" VueJS Plugin
"Plug 'neoclide/coc.nvim', {'release': 'branch'}
"Plug 'neoclide/coc-vetur'

" Other languages
"Plug 'tpope/vim-rails', { 'for': [] }
"Plug 'derekwyatt/vim-scala'
"Plug 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
"Plug 'rust-lang/rust.vim'
"Plug 'phpactor/phpactor'
"Plug 'shawncplus/phpcomplete.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()


let NERDTreeMinimalUI = 1
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
let NERDTreeIgnore = ['\.o$']


"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

vmap <leader>/ <leader>c<space>


 function! BuildYCM(info)
   if a:info.status == 'installed' || a:info.force
     !./install.py --clang-completer --gocode-completer --ts-completer 
   endif
 endfunction

" Trigger configuration. You need to change this to something else than <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"





" Browsing - Yggdroot/indentLine
autocmd! User indentLine doautocmd indentLine Syntax

augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END


set termguicolors
let ayucolor="mirage"
"colorscheme ayu
colorscheme night-owl

"let g:lightline =  {
"  \ "colorscheme": 'ayu_mirage',
"  \}

" Easy-Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"let g:vue_disable_pre_processors = 1
let g:vue_pre_processors = 'detect_on_enter'
syn sync fromstart



" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1


" GitGutter {{{1
let g:gitgutter_max_signs = 500
" attempt to make gitgutter update faster
"set updatetime=50

" vim-javascript 
" source: https://github.com/pangloss/vim-javascript/issues/101#issuecomment-45543789
" change to 1 to enable concealing
let g:javascript_conceal = 1
let g:javascript_conceal_function   = 'ƒ'
let g:javascript_conceal_null       = 'ø'
let g:javascript_conceal_this       = '@'
let g:javascript_conceal_return     = '⇚'
let g:javascript_conceal_undefined  = '¿'
let g:javascript_conceal_NaN        = 'ℕ'
let g:javascript_conceal_prototype  = '¶'

" fix conceal color
highlight Conceal guifg=#ffb964

"highlight link Conceal SpellCap
"highlight link Conceal comment
" source: https://github.com/pangloss/vim-javascript/issues/151

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
" source: https://github.com/pangloss/vim-javascript



" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction





"set statusline=%l:%c::%{FugitiveStatusline()}%m\ \[%{&ff}:%{&fenc}:%Y]\ \[%{usa_president_2020#status()}\] %{getcwd()}\ \ \\\ %V\ %P%<%f
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\[%{usa_president_2020#status()}\]\ %P
"let g:lightline = { 'colorscheme':'nightowl'}
"let g:lightline = {
"\   'component_function': {
"\     'usa_president_2020': 'usa_president_2020#status',
"\   },
"\ }
"

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {<CR>}<left>
inoremap {<CR> {<CR>}<up><CR>iO
inoremap {;<CR> {<CR>};<ESC>O


