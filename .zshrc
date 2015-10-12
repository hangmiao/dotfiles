# Basic options ------------------------------------------------------------ {{{
 
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Tell zsh shell to find z.sh, which is a script handy for jumping to directories.
# . ~/z.sh
# function precmd () {
#   _z --add "$(pwd -P)"
# }

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


# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS="exfxcxdxcxegedabagacad"

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Gives vim style of line editing at the prompt
bindkey -v

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
# Key bindings ------------------------------------------------------------- {{{

# Use jj as escape key in vi mode 
bindkey -M viins 'jj' vi-cmd-mode

bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward


# }}}
# Alias -------------------------------------------------------------------- {{{

alias l="ls -lahG"

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

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Mac OS X ----------------------------------------------------------------- {{{

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app' 
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

alias o.='open .'

# }}}
# Git ---------------------------------------------------------------------- {{{

alias gs='git status'
alias gsi='git status --ignored'
alias gco='git checkout'
alias gb='git branch'
alias gl='git pull'
# alias gp='git push'

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
alias greset='git reset --hard origin/master'
# Revert to a particular commit that has already been pushed to the remote repo
alias gforce='git push origin master --force'

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


