filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-surround' "jump between curlies or any braces or parens
Plugin 'scrooloose/syntastic' "syntax checking
Plugin 'tpope/vim-dispatch' "this makes launching omnisharp asynchronous and easy
Plugin 'altercation/vim-colors-solarized' "solarized themes
Plugin 'scrooloose/NERDcommenter' "cool comment engine that allows ,c<space> to toggle comment on selection
Plugin 'scrooloose/NERDtree' "file browser that is supposedly nice
Plugin 'wesQ3/vim-windowswap' "really nice window swap with <leader>ww 
Plugin 'ternjs/tern_for_vim' "tern js completion
Plugin 'godlygeek/tabular' "this and the below plugin needed for reading .md files well
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-misc' "needed for vim-notes below
Plugin 'xolox/vim-notes' "cool notetaking app for vim, start with :Notes
Plugin 'dhruvasagar/vim-table-mode' "table mode, start with <leader>tm
call vundle#end()
filetype plugin indent on

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
"set autochdir "working dir is always current file
let mapleader = "," "this is the value of <Leader> who knows why it has to be configured

set wildmenu "this is the cool menu that shows you whats up when you press <Tab>

"Solarized
colorscheme solarized
set background=dark

"tab setup
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start "be able to backspace indents, lines, and start

"text width etc
set tw=80
set colorcolumn=80

"indent stuff
set cindent
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"tablemode stuff
let g:table_mode_header_fillchar="="

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

"syntastic setup
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

"global mappings
map \\ :set nohlsearch!<CR>
imap jj <Esc>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :TagBar<CR>

"shows the currently typing command by the ruler
set showcmd

if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("vms")
    set nobackup            " do not keep a backup file, use versions instead
else
    set backup              " keep a backup file
endif
