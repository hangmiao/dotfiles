" Basic options ------------------------------------------------------------ {{{

syntax on
filetype off
filetype plugin indent on
execute pathogen#infect()
set nocompatible
set modelines=0
set foldmethod=marker
set cmdheight=1
set shortmess=a
" waiting for another key to be pressed measured in milliseconds.
set timeoutlen=500

" set nowrap
" Automatic word wrapping
"set tw=79
"set formatoptions+=t
set splitright " By default, split to the right

" Word wrap without line breaks
:set wrap
:set linebreak
:set nolist  " list disables linebreak
set title " Display filename in titlebar
set nu
set rnu   
set lisp
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cindent
set shiftwidth=2
set clipboard+=unnamed 
set ignorecase
set smartcase
" set gdefault
set incsearch
set showmatch " show matching brackets (),{},[]
set mat=5 " show matching brackets for 0.5 seconds
set hlsearch
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set numberwidth=2
set guioptions+=a " macvim copied clipboard on selection 
let mapleader = ","

" :set cursorline
" :set cursorcolumn

" }}}
" Color settings ----------------------------------------------------------- {{{
colorscheme gotham
colorscheme mustang  
colorscheme solarized
colorscheme gotham256
colorscheme navajo-night
colorscheme brookstream

" set background=dark
" hi Comment ctermfg=LightBlue
" highlight Comment ctermfg=119
" highlight Identifier ctermfg=99AA00

:hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white " Highlight line to not be an underline
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

highlight SpecialKey term=standout ctermfg=DarkGrey ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc


set fillchars+=vert:│
"set fillchars=""
" Split chars bg color
:hi VertSplit term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" }}}
" Toggle Setup ------------------------------------------------------------- {{{

" Spell check toggle
map <F6> :setlocal spell! spelllang=en_us<CR>

map <F7> 15j<CR>
map <F8> 15k<CR>

set pastetoggle=<F9>

map <F10> :set list!<CR>
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Insert the current datestamp
:nnoremap <F11> "=strftime("%B %d, %Y")<CR>P
:inoremap <F11> <C-R>=strftime("%B %d, %Y")<CR>

" }}}
" Quick editing ------------------------------------------------------------ {{{

" Edit the vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<CR>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" Sudo to save file with temporary privileges
command! W w !sudo tee % &>/dev/null

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,cr :lcd <c-r>=FindGitDirOrRoot()<cr><cr>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" }}}
" Splits ------------------------------------------------------------------- {{{

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" create 
nnoremap c<C-j> :bel sp new<cr> 
nnoremap c<C-k> :abo sp new<cr>
nnoremap c<C-h> :lefta vsp new<cr>
nnoremap c<C-l> :rightb vsp new<cr>

" resize
nnoremap g<C-j> <C-w>j<C-w>_ 
nnoremap g<C-k> <C-w>k<C-w>_
nnoremap g<C-h> <C-w>h<C-w>_
nnoremap g<C-l> <C-w>l<C-w>_

" delete
nnoremap d<C-j> <C-w>j<C-w>c 
nnoremap d<C-k> <C-w>k<C-w>c
nnoremap d<C-h> <C-w>h<C-w>c
nnoremap d<C-l> <C-w>l<C-w>c

" }}}
" Command editing ---------------------------------------------------------- {{{
" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-B>      <Left>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" }}}
" Life savers -------------------------------------------------------------- {{{

" Refresh web pages after saving file
autocmd BufWriteCmd *.html,*.php,*.js,*.css,*.gtpl,*.sass,*.erb :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction


" Bubble single lines
nnoremap <leader>k [e
nnoremap <leader>j ]e

" Bubble multiple lines
vmap <leader>k [egv
vmap <leader>k ]egv

" Pry ---------------------------------------------------------------------- {{{

" Shorthand to type binding.pry 
:ab pry binding.pry
:ab pry- require 'pry-debugger'
:ab p* p '\n\n\n', '*'*128, '\n\n\n'


" Make pry debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" }}}

" Highlight Word {{{

" Show different colors of words highlighted simultaneously using <leader>N where N is
" a number from 1-6.
function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}
" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=14
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=13
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=26

" }}}
" MarkChanged {{{

sign define line_changed text=+ texthl=DiffAdded

function! MarkChanged(s, e)
    for i in range(a:s, a:e)
        exe ":sign place " . i . " line=" . i . " name=line_changed file=" . expand("%:p")
    endfor
endfunction

function! MarkUnchanged(s, e)
    for i in range(a:s, a:e)
        call cursor(i, 0)
        silent! sign unplace
    endfor
endfunction

command! -range MarkChanged call MarkChanged(<line1>, <line2>)
command! -range MarkUnchanged call MarkUnchanged(<line1>, <line2>)

" nnoremap <leader>m :MarkChanged<cr>
" vnoremap <leader>m :MarkChanged<cr>
" nnoremap <leader>M :MarkUnchanged<cr>
" vnoremap <leader>M :MarkUnchanged<cr>

" }}}
" MS to UTC {{{

function! MS2UTC(ms)
    let seconds = strpart(a:ms, 0, strlen(a:ms) - 3)
    return substitute(system("date -ur " . seconds), "\n\n*", "", "")
endfunction

function! MS2UTCWord()
    return MS2UTC(expand("<cword>"))
endfunction

nnoremap <leader>U :echo MS2UTCWord()<cr>

" }}}

" }}}

" Indent Guides {{{

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=3
nnoremap <leader>I :call IndentGuides()<cr>

" }}}


" Search-and-replace now is a breeze! Faster than %s/thing/another_thing/gc
" 1. Search things usual way using /something
" 2. hit vs, replace first match, and hit jj
" 3. hit n.n.n.n.n. reviewing and replacing all matches
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>


" Source the vimrc file after saving it. So don't have to reload Vim to see the changes.
" Autocmd that resources your vimrc always use autocmd-nested so Powerline
" doesn't break.
augroup MyAutoCmd
  autocmd!
  autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" }}}
" Vundle Setup ------------------------------------------------------------- {{{

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'Chiel92/vim-autoformat'
" Bundle 'terryma/vim-smooth-scroll'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
Bundle 'ap/vim-buftabline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'


" }}}
" Plugin settings ---------------------------------------------------------- {{{

" YCM
" Fix 'ValueError: Still no compile flags, no completions yet.'
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']   

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" EasyMotion
hi EasyMotionShade ctermfg=234
let g:EasyMotion_leader_key = '<Leader>'
" forwards <- ,f
nmap <leader>f <Plug>(easymotion-w)
" backwards <- ,b
" go change cursor
nmap <leader>g <Plug>(easymotion-f)

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
" nmap <Space>o :CtrlP<cr>
nmap <leader>p :CtrlP<cr>
set runtimepath^=~/.vim/bundle/ctrlp.vim

" The Silver Searcher, aka Ag
nnoremap \ :Ag<SPACE>
nnoremap \q :Ag -Q '

" Ctags
" Check the current folder for tags file and keep going one directory up all
" the way to the root folder. SO you can be in any sub-folder in your project and it'll be able to find the
" tags files. 
set tags=tags;/
nnoremap <leader>. :CtrlPTag<cr>

" Ack
nnoremap <leader>a :Ack
" find usages
nmap <a-F7> :Ack -w <c-r><c-w><cr>

" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

nmap <leader>sjs :set ft=javascript <cr>
nmap <leader>srb :set ft=ruby <cr>

" smooth-scroll
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" FuzzyFinder
nmap ;d :FufFileWithCurrentBufferDir<CR>
nmap ;f :FufBuffer<CR>
nmap ;t :FufTaggedFile<CR>
nnoremap ;l  :FufTag<cr>
nnoremap ;<Space> :FufBookmarkDir<cr>
nnoremap ;f :FufFile<cr>
nnoremap ;h :FufFile $HOME/<cr>
nnoremap ;j  :FufFile $HOME/.vim/<cr>
nnoremap ;db :FufFile $HOME/Dropbox/<cr>
let g:fuf_file_exclude = '\v\~$|\.(DS_Store|o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_buffer_keyDelete = '<C-d>'

" SnipMate
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['ruby'] = 'ruby,rails,ruby-rails,ruby-1.9'
":imap <C-space> <Plug>snipMateNextOrTrigger
":smap <C-space> <Plug>snipMateNextOrTrigger

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Buftabline
set hidden
let g:buftabline_show=1
let g:buftabline_numbers=1
let g:buftabline_indicators=1
let g:buftabline_separators=0
:hi TabLine cterm=NONE ctermfg=10 ctermbg=236 term=NONE " other tabs
:hi TabLineSel cterm=NONE ctermfg=8 ctermbg=2 term=NONE " current tab
:hi PmenuSel ctermfg=8 ctermbg=220 term=NONE " Modified tabs
:hi TabLineFill guifg=LightGreen guibg=DarkGreen ctermfg=233 ctermbg=233 " where there are no labels


" }}}
" My Functions ------------------------------------------------------------- {{{

function! RubySyntax()
  :w
  !ruby -c %
endfunction

function! RubyRun()
  :w
  !ruby %
endfunction

function! ShellList()
  !ls -lah
endfunction



function! FindGitDirOrRoot()
  let filedir = expand('%:p:h')
  if isdirectory(filedir)
    let cmd = 'bash -c "(cd ' . filedir . '; git rev-parse --show-toplevel 2>/dev/null)"'
    let gitdir = system(cmd)
    if strlen(gitdir) == 0
      return '/'
    else
      return gitdir[:-2] " chomp
    endif
  else
    return '/'
  endif
endfunction

" }}}
" My Remappings ------------------------------------------------------------ {{{

nnoremap <silent> H :bp<CR>
nnoremap <silent> L :bn<CR>
inoremap jj <ESC>
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :call RubySyntax()<cr>
nnoremap <leader>r :call RubyRun()<cr>
" nnoremap <leader>l :call ShellList()<cr>
nnoremap <space> :
nnoremap <leader>qq q:
noremap <tab> %
vnoremap <tab> %

nnoremap <leader>h ^
nnoremap <leader>l g_

" }}}
" Backups ------------------------------------------------------------------ {{{

set backup                        " enable backups
set noswapfile                    " it's 2015, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Don't explode when editing crontab files.
set backupskip=/tmp/*,/private/tmp/*"

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" Random Stuff ------------------------------------------------------------- {{{

" Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h
" Wipe out all buffers
nmap <silent> <Leader>da :1,9000bwipeout<cr>


autocmd VimLeave * :!open -a iTerm2

if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

" }}}
" FileTypes ---------------------------------------------------------------- {{{

augroup myfiletypes
    " Clear out old autocmds in group.
    autocmd!

    " Set filetypes
    au BufNewFile,BufRead *.js.erb setfiletype=javascript.ruby
    autocmd BufNewFile,BufRead *.html.erb set filetype=html.ruby
    au BufNewFile,BufRead *.j setf objj
    au BufNewFile,BufRead Jakefile setfiletype javascript
    au BufNewFile,BufRead *.god setfiletype ruby 
    au BufNewFile,BufRead *.pill setfiletype ruby 
 

    " File type specific behaviour
    autocmd FileType cpp,php,ruby,eruby,yaml,html,xhtml,xml set sw=2 ts=2 expandtab
    autocmd FileType objj,javascript,javascript.ruby set sw=4 ts=4 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make set sw=8 ts=8 noexpandtab

    autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType java setlocal shiftwidth=2 tabstop=8 softtabstop=2 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
augroup END


" }}}
" Folding ------------------------------------------------------------------ {{{

" Save folding when exit
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

set foldlevelstart=0

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

function! MyFoldText() " {{{

    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()

" }}}
" Window handling ---------------------------------------------------------- {{{

" Resize splits when the window is resized
au VimResized * :wincmd =

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" }}}



