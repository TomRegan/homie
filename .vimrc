" File        : .vimrc
" Author      : Tom Regan <


" ---------------------------------------------------------------------
" Vim Settings " ------------------------------------------------------
" ---------------------------------------------------------------------

" Pathogen "
" ---------------------------------------------------------------------
filetype off                     "required for pathogen to load plugins
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" General Settings "
" ---------------------------------------------------------------------
filetype plugin indent on
set t_Co=256                     "256 colour setting
set nocompatible                 "disable Vi compatibility
set autoindent                   "use current indentation for new lines
set backspace=indent,eol,start   "allow c-h over everything
set backupdir=/tmp               "keep swap files in /tmp
set encoding=utf-8               "defualt encoding
set filetype=on                  "detect filetype
set ruler                        "display the cursor position
set virtualedit=all              "allow cursor to roam in command mode
set ttyfast                      "send more characters for quicker drawing
set paste                        "enable pasting without skew
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set mouse=a                      "mouse support
"
" MacOSX Disabilities ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set undodir=/tmp                 "keep undo files in /tmp
" set undofile                     "persistent undo


" UI Settings "
" ---------------------------------------------------------------------
syntax enable                      "syntax enabled
set background=dark                "variety of solarized
colorscheme solarized
set breakat="^I!@*-+;:,./?"        "break line on characters
set confirm                        "instead of failing, request confirmation
set display=lastline               "show over-long lines instead of @
set laststatus=2                   "always display status bar
set list                           "show pagination characters
set listchars=tab:»\ ,trail:·,eol:↵ "show tabs and trailing ws
set linebreak                      "break line instead of inserting newline
set nowrap                         "don't wrap long lines
set number                         "line numbers
set showcmd                        "show the command being typed
                                   "  for :q, :e
set showtabline=1                  "show the tab bar when there are tabs
set syntax=on                      "syntax highlighting on
au BufRead,BufNewFile *.asm set filetype=asmmips32
au Syntax newland source /home/tom/.vim/syntax/asmmips32.vim
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" colo molokai_t_Co256
" let g:solarized_termcolors=256
" let g:solarized_visibility="normal"
" let g:solarized_contrast="normal"
" let g:solarized_termtrans=1
" set cursorcolumn                   "highlight the current column
" set cursorline                     "highlight the current line
" set matchpairs                     "highlight block delimiting characters
" set matchtime=5                    "tenths of a second to show highlight
" set showbreak=\                    "set the line continuation character


" Buffers "
" ---------------------------------------------------------------------
nmap <silent> <C-e> :e#<CR>
nmap <silent> <C-j> :bnext<CR>
nmap <silent> <C-k> :bprev<CR>


" Movement "
" ---------------------------------------------------------------------
nmap <silent> ; $
nmap <silent> QQ :q<CR>
nmap <silent> WW :w<CR>
nmap <silent> WQ :xa<CR>
nmap <silent> QA :qa<CR>


" Search "
" ---------------------------------------------------------------------
set incsearch                    "incremental search
set hlsearch                     "highlight all search matches
set ignorecase                   "ignore case in search
set smartcase                    "respect upper case in search
nmap \q :nohlsearch<CR>


" Text Formatting "
" ---------------------------------------------------------------------
set shiftwidth=4                 "width when using >> <<
set tabstop=4                    "set tab width
set expandtab                    "convert tabs to spaces
set smartindent                  "set indent based on blocks in code
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set infercase                    "inferred case


" Folding "
" ---------------------------------------------------------------------
set foldcolumn=1                 "show folds in left gutter
set foldenable                   "enable folding
set foldmethod=indent            "the kind of folding
set foldlevel=100                "100=do not autofold
au BufWinLeave *.* mkview        "save folds between edits
au BufWinEnter *.* silent loadview
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Spell "
" ---------------------------------------------------------------------
noremap gs :setlocal spell! spelllang=en_gb<CR>
hi SpellBad cterm=reverse ctermfg=1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"set spell


" ---------------------------------------------------------------------
" Plugin Settings " ---------------------------------------------------
" ---------------------------------------------------------------------

" Align "
" ---------------------------------------------------------------------
map g= :Align =<CR>


" ctags "
" ---------------------------------------------------------------------
set tags+=~/.vim/tags/cpp
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" Gundo "
" ---------------------------------------------------------------------
map gu :GundoToggle<CR>


" NERDTree "
" ---------------------------------------------------------------------
map gn :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
" let NERDTreeHighlightCursorline=1
" let NERDTreeChDirMode=2
" let NERDChristmasTree=0

" OmniComplete "
" ---------------------------------------------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "show function parameters
let OmniCpp_MayCompleteDot = 1      "autocomplete after .
let OmniCpp_MayCompleteArrow = 1    "autocomplete after ->
let OmniCpp_MayCompleteScope = 1    "autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,preview
au FileType python set omnifunc=pythoncomplete#Complete
" ---------------------------------------------------------------------
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" PyFlakes "
" ---------------------------------------------------------------------
let g:pyflakes_use_quickfix = 0


" snipMate "
" ---------------------------------------------------------------------
let g:snips_author = 'Tom Regan <tom.regan@ovi.com>'


" Syntastic "
" ---------------------------------------------------------------------
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='●'
let g:syntastic_warning_symbol='●'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:syntastic_auto_loc_list=1


" SuperTab "
" ---------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
" au filetype python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=menuone,longest,preview
inoremap <nul> <C-x><C-o>
let g:SuperTabMappingBackward =  "<C-nul>"       "forward menu cycle
let g:SuperTabMappingForward  =  "<s-C-nul>"     "reverse menu-cycle
let g:SuperTabDefaultCompletionType = "context"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:SuperTabDefaultCompletionType = "context"


" delimitMate "
" ---------------------------------------------------------------------
let delimitMate_expand_cr=1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let delimitMate_expand_space=1
" imap <unique> <silent> <Tab> <Plug>delimitMateS-Tab


" Tagbar "
" ---------------------------------------------------------------------
map <silent> gm :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1


" Taglist "
" ---------------------------------------------------------------------
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" map <silent> gm :TlistToggle<CR>
" let Tlist_Inc_Winwidth=0            "Don't resize the window
" let Tlist_Use_Right_Window=0        "Open on the right of the screen
" let Tlist_GainFocus_On_ToggleOpen=1 "Focus Tlist window


" CtrlP "
" ---------------------------------------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


" Todolist "
" ---------------------------------------------------------------------
let g:tlTokenList = ['FIX', 'FIXME', 'TODO']


" ---------------------------------------------------------------------
" Color Overrides " ---------------------------------------------------
" ---------------------------------------------------------------------

hi! link SignColumn LineNr
hi! link StatusLine DiffAdd
