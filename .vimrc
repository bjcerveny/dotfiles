"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc
"       AUTHOR:  Dr.-Ing. Fritz Mehner
"      VERSION:  1.0
"      CREATED:  23.05.2008
"     REVISION:  $Id: customization.vimrc,v 1.8 2009/04/03 09:54:21 mehner Exp $
"===================================================================================
"
"===================================================================================
" GENERAL SETTINGS
"===================================================================================
"
"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible
filetype off                   " required!

"-------------------------------------------------------------------------------
" Set up Vundle
"-------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
Plugin 'tpope/vim-fugitive'
Plugin 'perl-support.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Markdown'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tomasr/molokai'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd filetype perl   set expandtab
autocmd filetype python set expandtab
autocmd filetype python set colorcolumn=120
autocmd filetype ruby   set expandtab
autocmd filetype shell  set expandtab
autocmd filetype c      set expandtab
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on
"
" Platform specific items:
" - central backup directory (has to be created)
" - default dictionary
" Uncomment your choice.  
if  has("win16") || has("win32") || has("win64") || has("win95")
"
"  runtime mswin.vim
"  set backupdir =$VIM\vimfiles\backupdir
"  set dictionary=$VIM\vimfiles\wordlists/german.list
else
"  set backupdir =$HOME/.vim.backupdir
"  set dictionary=$HOME/.vim/wordlists/german.list,$HOME/.vim/wordlists/english.list
endif

"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " always set autoindent on
set copyindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set nobackup                    " don't bother with a backup file. Use SCM.
set noswapfile
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=1000                " keep many lines of command line history
set undolevels=1000             " use many muchos levels of undo
set hlsearch                    " highlightthe last used search pattern
set incsearch                   " do incremental searching
set gdefault                    " global search/replace by default
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set mouse=a                     " enable the use of the mouse
set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=2                " number of spaces to use for each step of indent
set shiftround                  " use multiple of shiftwidth when indenting '<' and '>'
set showmatch                   " show matching parentheses
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set ignorecase
set smartcase                   " ignore case if search pattern all lowercase; else sensitive
set tabstop=4                   " number of spaces that a <Tab> counts for
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set visualbell                  " visual bell instead of beeping
set noerrorbells                " don't beep
set wildignore=*.bak,*.o,*.e,*~,*.swp " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set hidden                      " Hide buffers instead of closing them
set scrolloff=3
set ttyfast
set ruler
set laststatus=2
set wrap
if v:version >= 703
  set undofile
  " set relativenumber
endif


"let mapleader=", "              " change the mapleader from | to , 

nmap <silent> <leader>/ :nohlsearch<CR>

nnoremap / /\v
vnoremap / /\v

"-------------------------------------------------------------------------------
"  highlight paired brackets
"-------------------------------------------------------------------------------
highlight MatchParen ctermbg=blue guibg=lightyellow
colorscheme molokai
"
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"     F2  -  write file without confirmation
"     F3  -  call file explorer Ex
"     F4  -  show tag under curser in the preview window (tagfile must exist!)
"     F6  -  list all errors           
"     F7  -  display previous error
"     F8  -  display next error   
"     F12 -  list buffers and edit n-th buffer
"-------------------------------------------------------------------------------
noremap   <silent> <F2>         :write<CR>
noremap   <silent> <F3>         :Explore<CR>
noremap   <silent> <F4>         :execute ":ptag ".expand("<cword>")<CR>
noremap   <silent> <F5>         :copen<CR>
noremap   <silent> <F6>         :cclose<CR>
noremap   <silent> <F7>         :cprevious<CR>
noremap   <silent> <F8>         :cnext<CR>
noremap            <F12>        :ls<CR>:edit #
"
inoremap  <silent> <F2>    <C-C>:write<CR>
inoremap  <silent> <F3>    <C-C>:Explore<CR>
inoremap  <silent> <F4>    <C-C>:execute ":ptag ".expand("<cword>")<CR>
inoremap  <silent> <F5>    <C-C>:copen<CR>
inoremap  <silent> <F6>    <C-C>:cclose<CR>
inoremap  <silent> <F7>    <C-C>:cprevious<CR>
inoremap  <silent> <F8>    <C-C>:cnext<CR>
inoremap           <F12>   <C-C>:ls<CR>:edit #
"
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
 noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>

" Save typing shift-; to get into command mode. Just type ;.
nnoremap ; :
"
"
"===================================================================================
" VARIOUS PLUGIN CONFIGURATIONS
"===================================================================================
"
"-------------------------------------------------------------------------------
" perl-support.vim
"-------------------------------------------------------------------------------
"            
let g:Perl_Debugger = 'ptkdb'
"
"-------------------------------------------------------------------------------
" plugin taglist.vim : toggle the taglist window
" plugin taglist.vim : define the tag file entry for Perl
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
 noremap <silent> <F11>       :TlistToggle<CR>
inoremap <silent> <F11>  <C-C>:TlistToggle<CR>
"
let tlist_perl_settings  = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

au BufNewFile,BufRead *.gradle setf groovy

" Pylint config file
" let g:pymode_lint_config='$HOME/.pylint.rc'
