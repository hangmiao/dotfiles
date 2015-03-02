# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Tell zsh shell to find z.sh, which is a script handy for jumping to directories.
. ~/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/hahn/.rvm/gems/ruby-1.9.3-p547/bin:/Users/hahn/.rvm/gems/ruby-1.9.3-p547@global/bin:/Users/hahn/.rvm/rubies/ruby-1.9.3-p547/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/hahn/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/hahn/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

 
# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim'
  fi

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
#
#


source ~/z.sh

# PS1="\u$ "

eval "$(rbenv init -)"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# if [ -f ~/.git-completion.bash ]; then
#   source ~/.git-completion.bash
#   source ~/.git-prompt.sh
#   export PS1='\W$(__git_ps1 "(%s)") > '
# fi

# source ~/.git-prompt.sh

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
 
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

# Use jj as escape key in vi mode 
bindkey -M viins 'jj' vi-cmd-mode

bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

alias ll="ls -lahG"
# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'





# Ctrl + z to do things in zsh
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
