""" Plugin Installation
" Begin using vim-plug
call plug#begin('/root/.local/share/nvim/plugged')

"" General Settings
" Add sensible vim configuration
Plug 'tpope/vim-sensible'

" Manipulate surroundings in vim easily, e.g., {}, (), [], '',""
Plug 'tpope/vim-surround'

" Smart repeat . command in vim, just take it for granted
Plug 'tpope/vim-repeat'

" Vim commenter
Plug 'tpope/vim-commentary'

" Vim tmux navigator, seamlessly navigate between tmux and vim panes
Plug 'christoomey/vim-tmux-navigator'

" Make vim respect .editorconfig
Plug 'editorconfig/editorconfig-vim'

"" Visual
" OceanicNext theme
Plug 'mhartington/oceanic-next'

" Airline bar
Plug 'vim-airline/vim-airline'

"" Power Tools
" File search plugin
Plug 'ctrlpvim/ctrlp.vim'

"" Language Specific
" All in one language pack
Plug 'sheerun/vim-polyglot'

" Linting engine
Plug 'w0rp/ale'

" Emmet.io plugin
Plug 'mattn/emmet-vim'

" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'

" Add plugins to &runtimepath
call plug#end()

""" Plugin Configuration
"" Visual
" OceanicNext theme
if (has("termguicolors"))
 set termguicolors
endif

let g:airline_theme='oceanicnext'
" Enable airline
let g:airline#extensions#tabline#enabled = 1

syntax on
syntax enable
filetype plugin indent on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

if !empty(glob("/root/.local/share/nvim/plugged/oceanic-next/colors/OceanicNext.vim"))
  colorscheme OceanicNext
endif

"" Ale Lint Engine
" By default Ale runs all linters, which makes it very slow.
" This is to run one specific linter for each language.
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\}

let g:ale_cache_executable_check_failures=1
let g:ale_fix_on_save = 1
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"" Power Tools
" Use ag aka the_silver_searcher (installable by brew) for grep commands
set grepprg=ag\ --nogroup\ --nocolor

" Make CtrlP use ag aka the_silver_searcher (installable by brew) for listing
" the files. Way faster and no useless files (e.g., don't search within .git
" folder)
" Also turn off the caching of CtrlP indexing because the_silver_searcher is
" so fast
let g:ctrlp_user_command = 'ag %s -l --hidden --ignore .git --nocolor -g ""'
let g:ctrlp_use_caching = 0

"" Deoplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use tab for auto completion! very sick!
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""" Settings
" Bind space as leader key
let mapleader = "\<Space>"

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd=

" Zoom a vim pane, C-w to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Set vim to show number
set number

" Map in normal mode key 0 to go to the start of line at the start of the text
nmap 0 ^

" Bind ctrl-s to write to file
nmap <C-s> :w<cr>

" Bind Ctrl-n to file tree toggle
nmap <C-n> :e .<cr> 

" Nerdtree style :e file tree
let g:netrw_liststyle=3

" Highlight current line
set cursorline

" Number of tabs indentation when vim opens a file and read a <TAB> character
" to equal 2 columns
set tabstop=2

" Number of tabs indentation when editing, when we actually hit <TAB>
set softtabstop=2

" Tabs are spaces
set expandtab

" How many indentations when using >> and <<
set shiftwidth=2

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" Bind Ctrl-S and Enter in Insert mode to get out from insert mode
imap <C-s> <esc>

" Bind Ctrl-S and Enter in Visual mode to get out from visual mode
xmap <C-s> <esc>

" Make j and k movement in normal mode to travel like normal in texts that are
" wrapped by vim, try travelling this long comment line and see why it is more
" reasonable to map it like this
nmap k gk
nmap j gj

" bind K to grep word under cursor
" This will make K search for that word in current folder recursively
" and display the result in a tiny window
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Regexp syntax highlight
set regexpengine=1

" Autosave when leaving from vim to tmux
let g:tmux_navigator_save_on_switch = 1
