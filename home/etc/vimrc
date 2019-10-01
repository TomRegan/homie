" File        : .vimrc
" Author      : Tom Regan <code.tom.regan@gmail.com>

" *********************************************************************
" Application Settings " **********************************************
" *********************************************************************

" Bundler Settings "
" ---------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Bundles "
" ---------------------------------------------------------------------
Bundle 'gmarik/vundle'
Bundle 'Solarized'
Bundle 'The-NERD-tree'
Bundle 'delimitMate.vim'
Bundle 'tComment'
Bundle 'syntastic'
Bundle 'ctrlp.vim'
Bundle 'Gundo'
Bundle 'vim-sparkup'
Bundle 'vim-multiple-cursors'
Bundle 'vim-fugitive'
Bundle 'go.vim'


" General Settings "
" ---------------------------------------------------------------------
filetype plugin indent on
set t_Co=256                     "256 colour setting
set autoindent                   "use current indentation for new lines
set backspace=indent,eol,start   "allow del over everything
set backupdir=/tmp               "keep swap files in /tmp
set encoding=utf-8               "defualt encoding
set filetype=on                  "detect filetype
set ruler                        "display the cursor position
set virtualedit=all              "allow cursor to roam in command mode
set ttyfast                      "send more characters for quicker drawing
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set paste                        "enable pasting without skew


" UI Settings "
" ---------------------------------------------------------------------
syntax enable                      "syntax enabled
set background=dark                "variety of solarized
colorscheme solarized
set completeopt+=preview
set breakat="^I!@*-+;:,./?"        "break line on characters
set confirm                        "instead of failing, request confirmation
set display=lastline               "show over-long lines instead of @
set laststatus=2                   "always display status bar
set list                           "show pagination characters
set listchars=tab:»\ ,trail:·,eol:↵ "show tabs and trailing ws
set linebreak                      "break line instead of inserting newline
set nowrap                         "don't wrap long lines
set nonu                           "no line numbers
set showcmd                        "show the command being typed
                                   "  for :q, :e
set showtabline=1                  "show the tab bar when there are tabs
set syntax=on                      "syntax highlighting on
au BufRead,BufNewFile *.asm set filetype=asmmips32
au Syntax newland source /home/tom/.vim/syntax/asmmips32.vim


" Buffers "
" ---------------------------------------------------------------------
nmap <silent> <C-e> :e#<CR>
nmap <silent> <C-j> :bnext<CR>
nmap <silent> <C-k> :bprev<CR>


" Movement "
" ---------------------------------------------------------------------
nmap <silent> ; $
nmap <silent> d; d$
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
set foldenable                   "enable folding
set foldmethod=indent            "the kind of folding
set foldlevel=100                "100=do not autofold
au BufWinLeave *.* mkview        "save folds between edits
au BufWinEnter *.* silent loadview
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"set foldcolumn=1                 "show folds in left gutter


" Spell "
" ---------------------------------------------------------------------
noremap gs :setlocal spell! spelllang=en_gb<CR>
hi SpellBad cterm=reverse ctermfg=1


" Color Overrides "
" ---------------------------------------------------------------------
hi! link SignColumn LineNr
hi! link Comment vimIsCommand
hi! link vimLineComment Comment


" *********************************************************************
" Plugin Configuration " **********************************************
" *********************************************************************

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
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let NERDTreeHighlightCursorline=1
" let NERDTreeChDirMode=2
" let NERDChristmasTree=0


" Syntastic "
" ---------------------------------------------------------------------
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='●'
let g:syntastic_warning_symbol='●'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:syntastic_auto_loc_list=1


" CtrlP "
" ---------------------------------------------------------------------
set rtp^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_cmd = 'CtrlPMixed'          " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'    " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1     " show the match window at the top of the screen
let g:ctrlp_max_height = 10             " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already
let g:ctrlp_use_caching = 1             " enable caching
let g:ctrlp_clear_cache_on_exit=0       " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 1             " show me dotfiles
let g:ctrlp_mruf_max = 250              " number of recently opened files
let g:ctrlp_map = '<C-t>'               " remap to unused key


" delimitMate "
" ---------------------------------------------------------------------
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


" Todolist "
" ---------------------------------------------------------------------
let g:tlTokenList = ['FIX', 'FIXME', 'TODO']


" vim-multiple-cursors "
" ---------------------------------------------------------------------
let g:multi_cursor_next_key="<C-n>"
let g:multi_cursor_prev_key="<C-p>"
let g:multi_cursor_skip_key="<C-x>"
let g:multi_cursor_exit_key="<Esc>"

