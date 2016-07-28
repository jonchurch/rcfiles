call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'for': ['C', 'C++'], 'branch': 'stable' }
Plug 'tpope/vim-surround' "jump between curlies or any braces or parens
Plug 'neomake/neomake', has('nvim') ? {} : { 'on': [] } "replacment for syntastic that is asynchronous
Plug 'scrooloose/syntastic', has('nvim') ? { 'on': [] } : {}  "syntax checking
Plug 'altercation/vim-colors-solarized' "solarized themes
Plug 'scrooloose/NERDcommenter' "cool comment engine that allows ,c<space> to toggle comment on selection
Plug 'scrooloose/NERDtree', { 'on': 'NERDTreeToggle' } "file browser that is supposedly nice
Plug 'majutsushi/TagBar', { 'on': 'TagBarToggle' } "tagbar for browsing source
Plug 'wesQ3/vim-windowswap', { 'on': 'WindowSwap' } "really nice window swap with <leader>ww
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }  "tern js completion
Plug 'pangloss/vim-javascript', { 'for' : ['javascript', 'javascript.jsx'] } "better js indenting and stuff
Plug 'mxw/vim-jsx', { 'for' : ['javascript', 'javascript.jsx'] } "jsx highlighting
Plug 'godlygeek/tabular', { 'for': 'markdown' } | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } "needed for reading .md files well
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes' "cool notetaking app for vim, start with :Notes
Plug 'dhruvasagar/vim-table-mode' "table mode, start with <leader>tm
Plug 'tommcdo/vim-exchange' "exchange text with cx{motion} cxx (for line) or X in visual mode
Plug 'airblade/vim-gitgutter' "adds add and remove annotations to files for git
Plug 'vim-utils/vim-man' "man pages, bitch, fuck less
Plug 'vim-airline/vim-airline' "status bar so pretty
Plug 'vim-airline/vim-airline-themes' "status bar EVEN PURTIER
Plug 'mattn/emmet-vim' "html magic tags blasphemy, html:5<C-y>,
call plug#end()

"My settings and things
set exrc "execute a local vimrc file for project configuration
set secure "make it secure so that no one can infect my machine with a malicious vimrc
set nocompatible "for compatibility with modern vim and not old vi
set autoindent "keep indents aligned when programming etc
set number "show line numbers
set ruler "show ruler in bottom right
set hidden "allow me to make a buffer hidden without !, this way i can keep a buffer open but not in a window
set splitright
set splitbelow "these maket he splits go where i want
set backupdir=$HOME/.vim/backupdir,. "set backup directory for ~ files in case i fuck up
set directory=$HOME/.vim/swapdir,. "swap files for swap yo
set makeprg=make "make command makes with make
set mouse="" "if i wanted to use a mouse, I'd use a bad text editor, I just want to change focus
"set autochdir "working dir is always current fileA
let mapleader = "," "this is the value of <Leader> who knows why it has to be configured
set updatetime=250 "makes things update faster
set wildmenu "this is the cool menu that shows you whats up when you press <Tab>

"Solarized
colorscheme solarized
set background=dark
set t_Co=256

"tab setup
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start "be able to backspace indents, lines, and start

"text width etc
set tw=100
set colorcolumn=80

"indent stuff
set cindent
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"NERDCommenter settings
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

"Notes mode
autocmd FileType notes setlocal tw=0
let g:notes_directories = ['~/OneDrive/notes', '~/.vim/plugged/vim-notes/misc/notes/user/']

"tablemode stuff
let g:table_mode_header_fillchar="="

"jsx settings
let g:jsx_ext_required = 0 "extension can be just js

"airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"YCM
nnoremap <Leader>jd :split<CR>:YcmCompleter GoToDefinition<CR>:res 2<CR>
nnoremap <Leader>jf :split<CR>:YcmCompleter GoToDeclaration<CR>:res 10<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
""Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"python set up
let g:ycm_python_binary_path = 'C:\Python35\python3.exe'
set tags+=./tags,tags;

"neocomplete/syntastic setup
if &runtimepath =~ 'syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_error_symbol = "!"
    let g:syntastic_warning_symbol = "W"
    let g:syntastic_python_pylint_post_args = '--rcfile="C:\users\brpollac\pylint.rc"'
else
    "neocomplete setup
endif

"global mappings
map \\ :set nohlsearch!<CR>
imap jj <Esc>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>T :TagBarToggle<CR>
"to erase what is in a tag (or jump to the inside in insert mode use cit)

"shows the currently typing command by the ruler
set showcmd

if has("vms")
    set nobackup            " do not keep a backup file, use versions instead
else
    set backup              " keep a backup file
endif
