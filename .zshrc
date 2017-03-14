# Locale options ------------------------------------------------------------ {{{

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# }}}
# Source ------------------------------------------------------------------- {{{

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/z.sh
# source ~/tmuxinator.zsh # somehow this is super slow

# }}}
# Set up zprezto  ---------------------------------------------------------- {{{

setopt AUTO_CD                # cd if no matching command
setopt AUTO_PARAM_SLASH       # adds slash at end of tabbed dirs
setopt CHECK_JOBS             # check bg jobs on exit
setopt CORRECT                # corrects spelling
setopt CORRECT_ALL            # corrects spelling
setopt EXTENDED_GLOB          # globs #, ~ and ^
setopt EXTENDED_HISTORY       # saves timestamps on history
setopt GLOB_DOTS              # find dotfiles easier
setopt HASH_CMDS              # save cmd location to skip PATH lookup
setopt HIST_EXPIRE_DUPS_FIRST # expire duped history first
setopt HIST_NO_STORE          # don't save 'history' cmd in history
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt LIST_ROWS_FIRST        # completion options left-to-right, top-to-bottom
setopt LIST_TYPES             # show file types in list
setopt MARK_DIRS              # adds slash to end of completed dirs
setopt NUMERIC_GLOB_SORT      # sort numerically first, before alpha
setopt PROMPT_SUBST           # sub values in prompt
# setopt RM_STAR_WAIT           # pause 10s before confirming rm *
setopt SHARE_HISTORY          # share history between open shells

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

# Make home and end the way they should be.
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# In the middle of typing something but wanna check something else
# <ESC>q
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Completion for processes
[ "$USER" = "root" ] && SWITCH='-A' || SWITCH="-u ${USER}"
zstyle ':completion:*:processes-names' command \
    "ps c $SWITCH -o command | uniq"
zstyle ':completion:*:processes' command \
    "ps c $SWITCH -o pid -o command | uniq"
unset SWITCH

# Extract Archives
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)       bunzip2 $1    ;;
            *.rar)       rar x $1      ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1     ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip $1      ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

unalias rm

# }}}
# Better settings ---------------------------------------------------------- {{{

# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

export EDITOR='nvim'


# }}}
# Alias -------------------------------------------------------------------- {{{

alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

alias l="ls -lahG"
alias fl="ls -ltra | grep '\->'" # find link

alias -g ...='../..'
alias -g ....='../../..'

alias dt='du -sh'

# Go to previous dir
alias pd="cd -"

# refresh shell
alias reload='source ~/.zshrc && source ~/.zpreztorc'

alias g='gvim --remote-silent'
#alias vi="mvim -v"

alias rw='resque-web ~/resque-web_init.rb -L'

# misc
# prevent the 'zsh: no matches found' error for Octopress
alias rake='noglob rake'

alias be='bundle exec'
alias bi='bundle install'
#alias rt='RAILS_ENV=test bundle exec rake minitest --trace'
alias rt='RAILS_ENV=test bundle exec rake test:all'

# IP addresses
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias tzip='tar -zcvf'
alias tunzip='tar -zxvf'

alias al='alias'
# e.g. run `ap 'gr'` (note the single quote)
alias ap="alias | grep $1"

# alias ag='ag --ignore=test --ignore=lib/stat-sv-health '
alias ag='ag --ignore=lib/stat-sv-health '

alias ducks='find ~ -xdev -type f -size +1000M'

alias m='mux'
alias h='history'

# Mac OS X ----------------------------------------------------------------- {{{

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
# alias sd='sudo shutdown -r now'

alias M='/Applications/Movist.app/Contents/MacOS/Movist'
alias o.='open .'
alias of='open -a Firefox'
alias oc='open -a "Google Chrome" '
alias oe='open -a Microsoft\ Excel '

# }}}
# Git ---------------------------------------------------------------------- {{{

alias gs='git status'
alias gsh='git show'
alias gsi='git status --ignored'
alias gco='git checkout'
alias gb='git branch'
alias gpl='git pull'
alias gpu='git push'

alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'

alias gd='git diff'
alias gdw='git diff --word-diff'
alias gdc='git diff --cached'
alias gdcw='git diff --cached --word-diff'

alias gcp='git cherry-pick'
alias gf='git fetch'

alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

alias gld="git log --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gln="git log --graph --pretty=tformat:'%C(yellow)%h%Creset -%C(red)%d%Creset %s %Cgreen(%ar)%Creset %C(blue)<%an>%Creset'"

alias gr='git reset'
# Force Git to overwrite local files on pull
alias grm='git reset --hard origin/master'
alias grp='git reset --hard origin/production'
# Revert to a particular commit that has already been pushed to the remote repo
alias gforce='git push origin master --force'


# List untracked files
alias glu='git ls-files --others --exclude-standard'
# Nice alias for adding untracked files:
alias gau='!git add $(git ls-files -o --exclude-standard)'


# }}}
# }}}
# Life Savers -------------------------------------------------------------- {{{

# Ctrl + z to switch to zsh
# and then Ctrl + z back to Vim instead of typing fg<Enter>
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z




# e.g. Run 'recent 7' to find files modified in the past 7 days.
recent() {
  find ~ -type f -regex ".*\.txt" -mtime -$1 -exec vim "{}" +
}


# }}}
# RVM  --------------------------------------------------------------------- {{{

#### Add RVM Crap
# PATH=$HOME/.rvm/gems/ruby-1.9.3-p448/bin:$PATH # Add RVM to PATH for scripting
# rvm use ruby-1.9.3-p448 --default
# rvm get stable --auto-dotfiles

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/bin/python3:$PATH"
export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:/usr/games
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# echo "Going to load RVM"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# }}}
# Docker  ------------------------------------------------------------------ {{{

# docker-machine start default
# eval $(docker-machine env default)

# }}}
# Color settings ----------------------------------------------------------- {{{

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS="exfxcxdxcxegedabagacad"

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# }}}
# Key bindings ------------------------------------------------------------- {{{

# Gives vim style of line editing at the prompt
bindkey -v

# Use jj as escape key in vi mode
bindkey -M viins 'jj' vi-cmd-mode

bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^e' vi-end-of-line

export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# }}}
# Custom stuff ------------------------------------------------------------- {{{

function backmerge
{
  # do `git checkout production && git pull` first and fix conflict if any

  git push origin production
  isClean git checkout staging # if not clean, abort
  git pull
  isConflict git merge production # if there's conflict, abort
  git push origin staging

  isClean git checkout master
  git pull
  isConflict git merge staging
  git push origin master
}

function isConflict()
{
  $@ # run it first

  # Conflict
  if [[ $(git ls-files -u  | cut -f 2 | sort -u | wc -l) -ne 0 ]]
  then
    # echo it in red color
    echo -e "\n\nCannot \e[31m$@\e[0m: Conflict. \nAborting.\n\n\n"
    return 1
    #exit 1
  fi
}

function isClean()
{ # line 1
  current_git_status=`$@` # run it first
  if [[ "$current_git_status" == "" ]]
  then
    # echo it in red color
    echo -e "\n\nCannot \e[31m$@\e[0m: See the above msg. \nAborting.\n\n\n"
    return 1
    #exit 1
  fi
}

# }}}
# More Custom stuff -------------------------------------------------------- {{{

# w3m -cols 99999 -dump http://en.wikipedia.org/wiki/$(date +%B_%d) | less | sed -n '/Events/, /Births/ p' | sed -n 's/^.*• //p' | gshuf -n 1


function switchToMac
{
 cd ~/Development/Github/Notes/config
 rm database.yml
 ln -s database_mac.yml database.yml
 ..
 rails s --port 9000
}

function switchToDocker
{
 cd ~/Development/Github/Notes/config
 rm database.yml
 ln -s database_docker.yml database.yml
 ..
 docker-compose run web rm /myapp/tmp/pids/server.pid; docker-compose up
}

function addSub
{
  files=(*)
  for i in $files; do
    if [[ $i =~ \.mp4$ ]] || [[ $i =~ \.mkv$ ]]
      then
        echo "Adding sub to '$i'"
        mkvmerge -o "$PWD/${i%.*}"_new "$i" "${i%.*}".srt && rm "$i" "${i%.*}".srt && mv "${i%.*}"_new "$i"
    fi;
  done
}


# }}}

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin
# export LOG_LEVEL=DEBUG
export LOG_LEVEL=INFO
# source /usr/local/share/zsh/site-functions/_aws

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

alias sc='scala -Dscala.color'

