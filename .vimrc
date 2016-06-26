" Basic options ------------------------------------------------------------ {{{
scriptencoding utf-8

syntax on
filetype plugin indent on
" execute pathogen#infect()
set nocompatible " Be iMproved
set modelines=0
set foldmethod=marker
set cmdheight=1
set shortmess=a
" waiting for another key to be pressed measured in milliseconds.
" set timeoutlen=300
" No delay for escape key press
set ttimeoutlen=0


"set tw=79
"set formatoptions+=t
set splitright " By default, split to the right

" Word wrap without line breaks
:set wrap
" set nowrap
":set linebreak
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
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ruler
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set numberwidth=2
set guioptions+=a " macvim copied clipboard on selection

set so=7 " set 7 lines to the cursors - when moving vertical
set history=1000 " change history to 1000
set magic " Set magic on, for regex
" set scrolljump=8
set ttyfast            " smoother changes

" Fix line wrapping
set ww=<,>,[,],h,l

let mapleader = ","

" :set cursorline
" :set cursorcolumn
set lazyredraw

" setting path explicitly to make it load faster
let g:ruby_path = "/usr/bin/ruby"
" let g:python_host_prog = '/usr/local/bin/python3'

" Non-compatible
" set ttyscroll=0        " turn off scrolling
" set ttymouse=xterm2
" set encoding=utf-8

" }}}
" Better settings ---------------------------------------------------------- {{{

map <F7> 20j<CR>
map <F8> 20k<CR>

map <s-F7> 6j<CR> " Shift + F7
map <s-F8> 6k<CR>



" Make :help appear in a full-screen tab, instead of a window {{{

" This is much better for 13' laptop.
" cnoremap h<SPACE> tab help<SPACE>

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction


" }}}


" }}}
" Toggle Setup ------------------------------------------------------------- {{{

" Spell check toggle
map <F6> :setlocal spell! spelllang=en_us<CR>

set pastetoggle=<F9>

map <F10> :set list!<CR>
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«

" }}}
" Quick editing ------------------------------------------------------------ {{{

" Edit the vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>
nmap <silent> ,!v :so $MYVIMRC<CR>
nnoremap <leader>et :e ~/.tmux.conf<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>es :e ~/daily.txt<cr>
nnoremap <leader>em :e ~/most_recent_used.rb<cr>
nnoremap <leader>ec :e ~/changelog.md<cr>

" Sudo to save file with temporary privileges
command! W w !sudo tee % &>/dev/null

" Markdown to HTML
nmap <leader>md :%!~/.vim/plugin/Markdown.pl --html4tags <cr>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,cr :lcd <c-r>=FindGitDirOrRoot()<cr><cr>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

map <leader>re :call RenameFile()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>



" scroll the viewport faster
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$


" Automatically jump to end of text pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Close a buffer
nnoremap <leader>x :bd<cr>
nnoremap <leader>X :bd!<cr>

" Reload current buffer
nnoremap <leader>; :e!<cr>

" Tabs
" e.g. Ctrl + [
" nnoremap <C-[> :tabprev<cr>
" nnoremap <C-]> :tabnext<cr>
nnoremap <C-9> gT
nnoremap <C-0> gt

" noremap <A-[> gT
" noremap <A-]> gt

nnoremap <leader>t :tabnew<cr>
nnoremap <leader>w :tabclose<cr>


vnoremap <C-c> "+ygv"*y


" Substitute
" %s in normal mode
" selected texts in visual mode
nnoremap <leader>s :%s///g<left><left><left>
vnoremap <leader>s :s///g<left><left><left>

" Substitute all occurrences of a word where the cursor is placed
noremap <Leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>


nnoremap gw 0f=w

" Del text in current line but WITHOUT <CR>
nnoremap <leader>v 0v$hd

" Insert the current datestamp
" :nnoremap <leader>d i<SPACE><ESC>"=strftime("%B %d, %Y")<CR>p
" :inoremap <leader>d <SPACE><SPACE><ESC>"=strftime("%B %d, %Y")<CR>P
:nnoremap <leader>d i<ESC>"=strftime("%B %d, %Y")<CR>p
:inoremap <leader>d <SPACE><ESC>"=strftime("%B %d, %Y")<CR>P

" Close the current buffer and move to the previous one
  " nmap <leader>x :bp <BAR> bd #<CR>

nnoremap <leader>G :Gblame<CR>

" Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h
" Wipe out all buffers
" nmap <silent> <Leader>da :1,9000bwipeout<cr>


nnoremap <leader>p :pwd<cr>

" }}}
" Splits ------------------------------------------------------------------- {{{

" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" " resize current buffer by +/- 5
" nnoremap <leader><left> :vertical resize -10<cr>
" nnoremap <leader><down> :resize +5<cr>
" nnoremap <leader><up> :resize -5<cr>
" nnoremap <leader><right> :vertical resize +10<cr>

" noremap <silent> <C-Left> :vertical resize -3<CR>
" noremap <silent> <C-Right> :vertical resize -3<CR>
" noremap <silent> <C-Down> :resize -3<CR>
" noremap <silent> <C-Up> :resize -3<CR>

nnoremap <leader>- :bel sp new<cr>
nnoremap <leader>\ :rightb vsp new<cr>

nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

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
" cnoremap <ESC><C-H> <C-W>

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

" Uppercase (More convenient than using ~ and going back and forth)
" Note that this will overwrite the contents of the z mark.
inoremap <C-u> <esc>mzgUiw`za

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Keep the cursor in place while joining lines
nnoremap J mzJ`z



" Ack motions {{{

nnoremap <silent> <leader>M :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>M :<C-U>call <SID>AckMotion(visualmode())<CR>

" nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
" xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@
    call s:CopyMotionForType(a:type)
    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"
    let @@ = reg_save
endfunction

" }}}

" Pry ---------------------------------------------------------------------- {{{

" Shorthand to type binding.pry
" :ab pry- require 'pry-debugger'
" :ab pry- require 'pry-byebug'
" :ab pry binding.pry
:ab pry require 'pry-byebug'; binding.pry
:ab p* puts '', '*'*128


" Make pry debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<byebug\>"

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
  " autocmd!
  " autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

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

function! RailsRun()
  :w
  !RAILS_ENV=development ruby %
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



function! RenameFile()
let old_name = expand('%')
let new_name = input('New file name: ', expand('%'), 'file')
if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
endif
endfunction



" Strip trailing whitespace
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespace()


" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif


function! FormatSqlStr()
  :%s//\r&/g
  :%s/\\n,//g
  :%s/\\n//g
  :set ft=sql
endfunction

" }}}
" My Remappings ------------------------------------------------------------ {{{

nnoremap <silent> H :bp<CR>
nnoremap <silent> L :bn<CR>
inoremap jj <ESC>
nnoremap / /\v
vnoremap / /\v
"nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :call RubySyntax()<cr>
nnoremap <leader>r :call RubyRun()<cr>
nnoremap <leader>l :call RailsRun()<cr>
" nnoremap <leader>l :call ShellList()<cr>
nnoremap <leader>F :call FormatSqlStr()<cr>
nnoremap <space> :
nnoremap <leader>q q:

nnoremap <leader>h ^
nnoremap <leader>l g_

" Don't jump yet
nnoremap * * <c-o>

" Insert file name
imap ,fn <c-r>=expand('%:t')<cr>
" imap ,fn <c-r>=expand('%:t:r')<cr>

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> ,u~ :t.\|s/./\\~/g\|:nohls<cr>

" }}}
" Backups ------------------------------------------------------------------ {{{

set backup                        " enable backups
set noswapfile                    " it's 2015, Vim.

" set undofile
" set undodir="$HOME/.VIM_UNDO_FILES"
" set undolevels=5000


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

" Highlight every other line
 map <leader><Tab> :set hls<CR>/\n.*\n/<CR>

" }}}
" FileTypes ---------------------------------------------------------------- {{{

" JavascriptLibs:
let g:used_javascript_libs = 'jquery,underscore,angularjs,backbone'

augroup myfiletypes
    " Clear out old autocmds in group.
    autocmd!

    " Set filetypes
    " au BufNewFile,BufRead *.js.erb setfiletype=javascript.ruby
    au BufNewFile,BufRead *.js.erb setfiletype javascript
    autocmd BufNewFile,BufRead *.html.erb set filetype=html.ruby
    au BufNewFile,BufRead *.j setf objj
    au BufNewFile,BufRead Jakefile setfiletype javascript
    au BufNewFile,BufRead *.god setfiletype ruby
    au BufNewFile,BufRead *.pill setfiletype ruby
    au BufNewFile,BufRead *.rake setfiletype ruby
    au BufNewFile,BufRead *.scala setfiletype java


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
" autocmd BufWinEnter *.* silent loadview

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
set mouse=n

" Resize splits when the window is resized
au VimResized * :wincmd =

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>

" }}}
" Color settings ----------------------------------------------------------- {{{
" colorscheme solarized
" colorscheme monokai
" colorscheme busybee
" colorscheme PaperColor
" colorscheme colorsbox-material
" colorscheme gruvbox
colorscheme mustang

" set background=dark
"highlight Comment ctermfg=119 guifg=#87ff5f
"highlight Identifier ctermfg=99AA00

hi CursorLine cterm=NONE ctermbg=214 ctermfg=black guifg=black guibg=Orange " Highlight line to not be an underline
hi Visual  guifg=black guibg=LightBlue gui=none ctermfg=black ctermbg=214
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

highlight SpecialKey term=standout ctermfg=DarkGrey guifg=DarkGrey ctermbg=10 guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc

highlight MatchParen term=reverse ctermfg=248 guifg=#a8a8a8 ctermbg=242 guibg=#666666
highlight Folded term=standout ctermfg=235 ctermbg=6 guifg=#a0a8b0 guibg=#384048


" set enc=utf-8
set fillchars+=vert:│
"set fillchars=""


" Split chars bg color
hi VertSplit term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


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
hi def IndentGuides guibg=#303030 ctermbg=214
nnoremap <leader>I :call IndentGuides()<cr>

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
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#20B2AA ctermbg=14
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#9370DB ctermbg=13
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#FF6666 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#0070ff ctermbg=26

noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

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
" }}}
" Vundle Setup ------------------------------------------------------------- {{{


" If vundle is not installed, do it first
  let bundleExists = 1
  " if (!isdirectory(expand("$HOME/.vim/bundle/neobundle.vim")))
  "    call system(expand("mkdir -p $HOME/.vim/bundle"))
  "    call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"))
  "    let bundleExists = 0
  " endif

  if 0 | endif

  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" call plug#begin('~/.vim/plugged')
" call plug#begin('~/.config/nvim')

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" call vundle#begin()


NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'wavded/vim-stylus'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle '1995eaton/vim-better-javascript-completion'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundleLazy 'nikvdp/ejs-syntax',{'autoload':{'filetypes':['ejs']}}
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['json']}}

" NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'chrisbra/Colorizer'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'valloric/MatchTagAlways'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'benekastah/neomake'
" NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'matze/vim-move'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'matthewsimo/angular-vim-snippets'
NeoBundle 'ryanoasis/vim-webdevicons'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'sjl/clam.vim'
" NeoBundle 'fmoralesc/vim-tutor-mode'

" NeoBundle 'gosukiwi/vim-atom-dark'
" NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'ervandew/supertab'
" NeoBundle 'Quramy/tsuquyomi'
" NeoBundle 'ashisha/image.vim'
" NeoBundle 'othree/yajs.vim'

NeoBundle 'VundleVim/Vundle.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'uguu-org/vim-matrix-screensaver'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'hangmiao/tmux-powerline'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'ap/vim-buftabline'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-scripts/L9'
NeoBundle 'dmedvinsky/uritality.vim'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'beautify-web/js-beautify'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'vim-scripts/ZoomWin'

" NeoBundle 'Valloric/YouCompleteMe'
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'Lokaltog/powerline'
" NeoBundle 'terryma/vim-smooth-scroll'
" NeoBundle 'garbas/vim-snipmate'
" NeoBundle 'honza/vim-snippets'
" NeoBundle 'lilydjwg/colorizer'
" NeoBundle 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
" call vundle#end()
" call plug#end()
call neobundle#end()

" Required:
  filetype plugin indent on
  NeoBundleCheck
  if bundleExists == 0
    echo "Installing Bundles, ignore errors"
  endif



filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" }}}
" Plugin settings ---------------------------------------------------------- {{{

" Ag & Ack -------------------------- {{{

" The Silver Searcher, aka Ag
nnoremap \ :Ag<SPACE>
nnoremap \q :Ag -Q ''<Left>

let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ackprg = 'ag --vimgrep'

" Open a new tab and search for something.
" nmap <leader>a :tab split<CR>:Ack ""<Left>
" Match exact case, e.g. only search for small cases, use -s option
nmap <leader>a :e split<CR>:Ack ""<Left>

" Immediately search for the word under the cursor in a new tab.
nmap <leader>A :e split<CR>:Ack <C-r><C-w><CR>

" Ack
" find usages
nmap <a-F11> :Ack -w <c-r><c-w><cr>


" }}}
" NERD Tree ------------------------- {{{
" Toggle NERD Tree
nmap <leader>n :NERDTreeToggle<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

" NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
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



" }}}
" vim-devicons ---------------------- {{{

" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
" let g:WebDevIconsUnicodeDecorateFileNodes = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" }}}
" Startify -------------------------- {{{

" let g:startify_custom_header =
"   \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
let g:startify_custom_header = []
let g:startify_custom_indices = ['f', 'g', 'h']

autocmd User Startified setlocal cursorline

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
  \ ['   MRU:'],
  \ 'files',
  \ ['   MRU within this dir:'],
  \ 'dir',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ ]

let g:startify_session_dir = "~/.vim/sessions"

let g:startify_bookmarks = [
            \ { 'v': '~/.vim/vimrc' },
            \ '~/.zshrc',
            \ { 't': '/tmp' },
            \ ]

" let g:startify_custom_footer =
"       \ ['', " NeoVim", '']

hi StartifyBracket ctermfg=240 guifg=#585858
hi StartifyFile    ctermfg=147 guifg=#afafff
hi StartifyFooter  ctermfg=240 guifg=#585858
hi StartifyHeader  ctermfg=114 guifg=#87d787
hi StartifyNumber  ctermfg=215 guifg=#ffaf5f
hi StartifyPath    ctermfg=245 guifg=#8a8a8a
hi StartifySlash   ctermfg=240 guifg=#585858
hi StartifySpecial ctermfg=240 guifg=#585858


" }}}
" Tmux ------------------------------ {{{

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vim-tmux-navigator ---------------- {{{
"
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

if has('nvim')
  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

  " Neovim terminal mapping
  " terminal 'normal mode'
  tmap <esc> <c-\><c-n><esc><cr>

  set re=1 " Use the old regex engine to make render rb file faster in terminal
endif


" }}}

" }}}
" SnipMate -------------------------- {{{

"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['ruby'] = 'ruby,rails,ruby-rails,ruby-1.9'
":imap <C-space> <Plug>snipMateNextOrTrigger
":smap <C-space> <Plug>snipMateNextOrTrigger

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsNoMap=1

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Snipppets

" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-s>     <Plug>(neosnippet_expand_or_jump)
  smap <C-s>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-s>     <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets, ~/.vim/bundle/angular-vim-snippets/snippets'

" }}}
" Neocomplete ----------------------- {{{

" Use deoplete.
" set runtimepath+=~/.vim/bundle/deoplete.nvim
let g:deoplete#enable_at_startup = 1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }}}
" Syntastic ------------------------- {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_style_error_symbol = '⚡'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'

noremap <leader>st :SyntasticToggleMode<CR>

let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss','html'] }
map <Leader>e :lnext<CR>
map <Leader>E :lprev<CR>

" }}}
" Linting ----------------------------{{{

let g:syntastic_javascript_checkers = ['jscs', 'eslint']
" let g:syntastic_check_on_open = 0

function! neomake#makers#ft#javascript#eslint()
    return {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
        \ }
endfunction

let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake

function! JscsFix()
    let l:winview = winsaveview()
    % ! jscs -x
    call winrestview(l:winview)
endfunction

command JscsFix :call JscsFix()
noremap <leader>j :JscsFix<CR>
"}}}


noremap <c-f> :Autoformat<CR>
noremap <c-t> :Tabularize /


" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline_theme='oceanicnext'
let g:airline_theme = 'powerlineish'
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_extensions = ['branch', 'tabline']



" EasyMotion
hi EasyMotionShade ctermfg=234 guifg=#1c1c1c
let g:EasyMotion_leader_key = '<Leader>'
" forwards <- ,f
nmap <leader>f <Plug>(easymotion-w)
" backwards <- ,b
" go change cursor
nmap <leader>g <Plug>(easymotion-f)



" CtrlP
let g:ctrlp_cmd = 'CtrlP'
" nmap <Space>o :CtrlP<cr>
nnoremap <C-p> :CtrlP<cr>

set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }




" Ctags
" Check the current folder for tags file and keep going one directory up all
" the way to the root folder. SO you can be in any sub-folder in your project and it'll be able to find the
" tags files.
set tags=tags;/
nnoremap <leader>T :CtrlPTag<cr>



" FuzzyFinder
nmap "d :FufFileWithCurrentBufferDir<CR>
nmap "f :FufBuffer<CR>
nmap "t :FufTaggedFile<CR>
nnoremap "l  :FufTag<cr>
nnoremap "<Space> :FufBookmarkDir<cr>
nnoremap "f :FufFile<cr>
nnoremap "h :FufFile ~/<cr>
nnoremap "j :FufFile ~/.vim/<cr>
nnoremap "db :FufFile ~/Dropbox/<cr>
nnoremap "m :FufFile ~/.tmuxinator/<cr>
nnoremap "g :FufFile ~/Development/Github/<cr>
" let g:fuf_file_exclude = '\v\~$|\.(DS_Store|o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_buffer_keyDelete = '<C-d>'



" Buftabline
set hidden
let g:buftabline_show=1
let g:buftabline_numbers=1
let g:buftabline_indicators=1
let g:buftabline_separators=0
:hi TabLine cterm=NONE gui=NONE ctermfg=10 guifg=#009010 ctermbg=236 guibg=#303030 term=NONE " other tabs
:hi TabLineSel cterm=NONE gui=NONE ctermfg=8 guifg=#121212 ctermbg=2 guibg=#00c040 term=NONE " current tab
:hi PmenuSel ctermfg=8 guifg=#808080 ctermbg=220 guibg=#ffdf00 gui=NONE term=NONE " Modified tabs
:hi TabLineFill guifg=#121212 guibg=#121212 ctermfg=233 ctermbg=233 " where there are no labels



" Git gitgutter column colors
call gitgutter#highlight#define_highlights()
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=#009010
highlight GitGutterChange ctermfg=yellow guifg=#ffdf00
highlight GitGutterDelete ctermfg=red guifg=red
highlight GitGutterChangeDelete ctermfg=yellow guifg=#ffdf00

let g:gitgutter_map_keys = 0
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterRevertHunk
nmap <Leader>gv <Plug>GitGutterPreviewHunk

" SuperTab
" SuperTab doesn't provide auto pop up at the moment. Switching to Neocomplete.
"  let g:SuperTabDefaultCompletionType = "context"
"  let g:SuperTabClosePreviewOnPopupClose = 1

" Pasta
let g:pasta_disabled_filetypes = ['python', 'coffee']
let g:pasta_enabled_filetypes = ['ruby', 'pill', 'javascript', 'css', 'sh']
" Don't to override default p and P mappings
" let g:pasta_paste_before_mapping = ',P'
" let g:pasta_paste_after_mapping = ',p'


" }}}
" NeoVim  ------------------------------------------------------------------ {{{
" Switching to NeoVim

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
set virtualedit=
set display+=lastline




  " Make files look nice
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  autocmd FileType css,scss,sass :ColorHighlight


" Typescript & Javscript omni complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimjs#casesensistive = 1

  let g:vimjs#smartcomplete = 0
  let g:vimjs#chromeapis = 0
  autocmd FileType typescript inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  let g:typescript_indent_disable = 1
  autocmd FileType typescript setlocal completeopt-=preview


" Emmet customization
" Enable Emmet in all modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:user_emmet_mode='a'
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
   return "\<tab>"
   endfunction
   autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()

   let g:use_emmet_complete_tag = 1
   let g:user_emmet_install_global = 0
   autocmd FileType html,css,ejs EmmetInstall




" }}}
" Environments (GUI/Console) ----------------------------------------------- {{{

if has('gui_running')
    " GUI Vim
    let macvim_skip_colorscheme=1 " respect color settings in .vimrc

    " set guifont=Source\ Code\ Pro\ for\ Powerline:h16
    " set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Pomicons:h18
    set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types:h17

    set mouse=a

    " Remove all the UI cruft
    set guioptions-=T " Removes top toolbar
    set guioptions-=r " Removes right hand scroll bar
    set go-=L " Removes left hand scroll bar
    set go-=l
    set go-=R

    "highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    " set guicursor=n-c:block-Cursor-blinkon0
    " set guicursor+=v:block-vCursor-blinkon0
    " set guicursor+=i-ci:ver20-iCursor

    let g:deoplete#enable_at_startup = 0
    " nnoremap <D-e> :tabnew<cr>
endif

" }}}

noremap <tab> %
vnoremap <tab> %

nnoremap <leader>t :!tmux send-keys -t right C-d C-c C-c C-d C-c Up C-m <cr>
