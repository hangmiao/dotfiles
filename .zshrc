# Basic options ------------------------------------------------------------ {{{

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Tell zsh shell to find z.sh, which is a script handy for jumping to directories.
# . ~/z.sh
# function precmd () {
#   _z --add "$(pwd -P)"
# }

# Move next only if `homebrew` is installed
#if command -v brew >/dev/null 2>&1; then
#    # Load z if installed
#    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# }}}
# Better settings ---------------------------------------------------------- {{{

# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim'
  fi

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups
setopt ignore_eof
setopt rm_star_silent

# If a pattern for filename generation has no matches, print an error,
# instead of leaving it unchanged in the argument list. This also
# applies to file expansion of an initial ~ or =.
unsetopt nomatch
unsetopt correct_all

#Report the status of background jobs immediately, rather than waiting until just before printing a prompt
setopt notify

# beeps are annoying
setopt NO_BEEP

# }}}
# Alias -------------------------------------------------------------------- {{{

alias l="ls -lahG"
alias fl="ls -ltra | grep '\->'" # find link

alias dt='du -sh'

# Go to previous dir
alias pd="cd -"

# refresh shell
alias reload='source ~/.zshrc'

alias g='gvim --remote-silent'
#alias vi="mvim -v"

# misc
# prevent the 'zsh: no matches found' error for Octopress
alias rake='noglob rake'

alias be='bundle exec'
alias bi='bundle install'
#alias rt='RAILS_ENV=test bundle exec rake minitest --trace'
alias rt='RAILS_ENV=test bundle exec rake test:all'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias tzip='tar -zcvf'
alias tunzip='tar -zxvf'
# Mac OS X ----------------------------------------------------------------- {{{

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

alias o.='open .'
alias of='open -a Firefox'

# }}}
# Git ---------------------------------------------------------------------- {{{

alias gs='git status'
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

# }}}
# RVM  --------------------------------------------------------------------- {{{

#### Add RVM Crap
# PATH=$HOME/.rvm/gems/ruby-1.9.3-p448/bin:$PATH # Add RVM to PATH for scripting
# rvm use ruby-1.9.3-p448 --default
# rvm get stable --auto-dotfiles
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# echo "Going to load RVM"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# }}}
# Source ------------------------------------------------------------------- {{{

source $ZSH/oh-my-zsh.sh
source ~/z.sh
source ~/tmuxinator.zsh

# }}}
# Color settings ------------------------------------------------------------------- {{{

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


# }}}



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
  if [ $(git ls-files -u  | cut -f 2 | sort -u | wc -l) -ne 0 ]
  then
    # echo it in red color
    echo -e "\n\nCannot \e[31m$@\e[0m: Conflict. \nAborted."
    return 1
  fi
}

function isClean()
{
  git_status=`$@` # run it first

  # not clean, e.g.
  # "Please, commit your changes or stash them before you can switch branches."
  if [ "$git_status" == "" ]
  then
    # echo it in red color
    echo -e "\n\nCannot \e[31m$@\e[0m: See the above msg. \nAborting."
    return 1
  fi
}


# Locale settings (utf-8)
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
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
