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
# Color settings ----------------------------------------------------------- {{{

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS="exfxcxdxcxegedabagacad"

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Colour constants for nicer output.
GREEN='\033[0;32m'
RESET='\033[0m'

# }}}
# Source ------------------------------------------------------------------- {{{

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/z.sh
# source ~/tmuxinator.zsh # somehow this is super slow

# DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="/Users/hahn"
# echo "dotfiles dir: $DOTFILES_DIR"
. $DOTFILES_DIR/.zsh_utilities/youtube.sh
. $DOTFILES_DIR/.zsh_utilities/va.sh
. $DOTFILES_DIR/.zsh_utilities/http_proxy.sh


source /usr/local/share/zsh/site-functions/_aws

# }}}
# Set up zprezto  ---------------------------------------------------------- {{{

#disable auto correct
unsetopt correct_all

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

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

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
alias m='tmuxinator'
alias h='history'

# alias sc='scala -Dscala.color'
alias sc='sbt -Dscala.color console'
alias hs='stack ghci'
alias spl='bin/superpill --no-privileged'
alias cb='bin/cardboard'

# start docker
# alias ds="zsh --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias d='docker '
alias dm='docker-machine'
alias dcv='docker volume prune --force'
alias dewb='docker exec -ti $(docker-compose ps -q web) /bin/sh'
alias di='docker image ls'
alias dlv='docker volume ls'
# alias dps='docker ps -a'
alias dps='docker container ls -a'
alias drm='docker container rm'
alias drma='docker container ls -aq | xargs docker container stop; docker container ls -aq | xargs docker rm'
alias drmi='docker image rm'

alias dc=docker-compose
alias dcbu='docker-compose build'
alias dcki='docker-compose kill'
alias dclean='docker container prune --force; docker image prune --force'
alias dclw='docker-compose logs web'
alias dcps='docker-compose ps'
alias dcrm='docker-compose rm -f'
alias dcrwb='docker-compose run --service-ports web /bin/sh'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
# alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

# terraform
alias tfp="cd terraform; terraform init && terraform workspace select production && terraform plan --var-file environments/production.tfvars"
alias tfa="terraform apply --var-file environments/production.tfvars"

# alias fgco="git checkout $(git branch | fzf)"
# alias fgcor="git checkout --track $(git branch -r | fzf)"
# alias fgco="git checkout `git branch | fzf`"
# alias fgcor="git checkout --track `git branch -r | fzf`"

alias ti="terraform init"
alias tp="terraform plan"
alias ts="terraform show"
alias ta="terraform apply"

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
alias ol='open -a LibreOffice '

# }}}
# Git ---------------------------------------------------------------------- {{{

alias gs='git status -sb'
alias gsh='git show'
alias gsi='git status --ignored'
alias gco='git checkout'
alias gb='git branch'
alias gpl='git pull'
alias gpu='git push'

alias ga='git add'
alias gap='git add -p'
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
alias gau='git add $(git ls-files -o --exclude-standard)'


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



# gitPushNewBranch
function gpb() {
  # git push --set-upstream origin <BRANCH-NAME>

  # Get the current branch name, or use 'HEAD' if we cannot get it.
  branch=$(git symbolic-ref -q HEAD)
  branch=${branch##refs/heads/}
  branch=${branch:-HEAD}

  echo "Pushing to remote branch for ${GREEN}${branch}${RESET}..."

  # Push to origin, grabbing the output but then echoing it back.
  push_output=`git push origin -u ${branch} 2>&1`
  echo ""
  echo ${push_output}
}

# Push the current branch to origin, set upstream, open the PR page if possible.
function gpr() {
    gpb

    # Pushing take a little while, so let the user know we're working.
    echo "Opening pull request for ${GREEN}${branch}${RESET}..."

    # If there's anything which starts with http, it's a good guess it'll be a
    # link to GitHub/GitLab/Whatever. So open it.
    link=$(echo ${push_output} | grep -o 'http.*' | sed -e 's/[[:space:]]*$//')
    if [ ${link} ]; then
        echo ""
        echo "Opening: ${GREEN}${link}${RESET}..."
        python -mwebbrowser ${link}
    fi
}

alias gbm='git branch -r --sort=creatordate \
    --format "%(creatordate:relative);%(committername);%(refname:lstrip=-1)" \
    | grep -v ";HEAD$" \
    | column -s ";" -t \
    | grep hahnmiao'

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
# export PATH --------------------------------------------------------------------- {{{

#### Add RVM Crap
# PATH=$HOME/.rvm/gems/ruby-1.9.3-p448/bin:$PATH # Add RVM to PATH for scripting
# rvm use ruby-1.9.3-p448 --default
# rvm get stable --auto-dotfiles

export PATH="~/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/bin/python3:$PATH"
export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:/usr/games:/usr/local/Cellar/
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/qt5/bin:$PATH"
export PATH="/Users/hahn/Development/Github/dotfiles/utilities:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# echo "Going to load RVM"

# }}}
# Docker  ------------------------------------------------------------------ {{{

# docker-machine start default
# eval $(docker-machine env default)

# export HOST=host.docker.internal
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/hahn/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# }}}
# FZF  ------------------------------------------------------------------ {{{

# fcd - cd to selected directory
  fcd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
      -o -type d -print 2>/dev/null | fzf +m) &&
      cd "$dir"
  }

  # fcda - including hidden directories
  fcda() {
    local dir
    dir=$(find ${1:-.} -type d 2>/dev/null | fzf +m) && cd "$dir"
  }
  # cdf - cd into the directory of the selected file
  fcdf() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
  }

  # fh - repeat history
  fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
  }

  # fkill - kill process
  fkill() {
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]; then
      kill -${1:-9} $pid
    fi
  }

  fgco() {
    # suprisingly this behaves super werid, which runs fzf everytime a shell is open
    # alias fgco="git checkout `git branch | fzf`"
    git checkout `git branch | fzf`
  }

  # # fgco - checkout git branch/tag
  # fgco() {
  #   local tags branches target
  #   tags=$(
  #     git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}'
  #   ) || return
  #   branches=$(
  #     git branch --all | grep -v HEAD |
  #       sed "s/.* //" | sed "s#remotes/[^/]*/##" |
  #       sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}'
  #   ) || return
  #   target=$(
  #     (
  #       echo "$tags"
  #       echo "$branches"
  #     ) |
  #       # fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2
  #       fzf +m
  #   ) || return
  #   git checkout $(echo "$target" | awk '{print $2}')
  # }

  # fgcoc - checkout git commit
  fgcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
      commit=$(echo "$commits" | fzf --tac +s +m -e) &&
      git checkout $(echo "$commit" | sed "s/ .*//")
  }

  # fgshow - git commit browser
  fgshow() {
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
                  (grep -o '[a-f0-9]\{7\}' | head -1 |
                  xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                  {}
  FZF-EOF"
  }

  # fgcs - get git commit sha
  # example usage: git rebase -i `fcs`
  fgcs() {
    local commits commit
    commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
      commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
      echo -n $(echo "$commit" | sed "s/ .*//")
  }

  # fgstash - easier way to deal with stashes
  # type fstash to get a list of your stashes
  # enter shows you the contents of the stash
  # ctrl-d shows a diff of the stash against your current HEAD
  # ctrl-b checks the stash out as a branch, for easier merging
  fgstash() {
    local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
        fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b
    ); do
      mapfile -t out <<<"$out"
      q="${out[0]}"
      k="${out[1]}"
      sha="${out[-1]}"
      sha="${sha%% *}"
      [[ -z "$sha" ]] && continue
      if [[ "$k" == 'ctrl-d' ]]; then
        git diff $sha
      elif [[ "$k" == 'ctrl-b' ]]; then
        git stash branch "stash-$sha" $sha
        break
      else
        git stash show -p $sha
      fi
    done
  }

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
# Other Conf ------------------------------------------------------------- {{{

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# }}}
# Custom stuff ------------------------------------------------------------- {{{

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


# w3m -cols 99999 -dump http://en.wikipedia.org/wiki/$(date +%B_%d) | less | sed -n '/Events/, /Births/ p' | sed -n 's/^.*• //p' | gshuf -n 1

rmd () {
  pandoc $1 | lynx -stdin
}

# }}}
# More Custom stuff -------------------------------------------------------- {{{

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh


oa() {
  # open up resque-web
  open -a "Google Chrome" "https://$1:81"
  # open up resque-web for spiders
  open -a "Google Chrome" "https://$1:82"
  # open up kibana
  # Gotcha, it's http instead of https
  # open -a "Google Chrome" "http://$1:5601"
  # open up Sidekiq
  # Checkout Chef repo cardboard.json sidekiq
  # Also it's http
  # open -a "Google Chrome" "http://$1:28056"
  # open up app
  open -a "Google Chrome" "https://$1"
}

# }}}

eval "$(rbenv init -)"

# things needed to be at the end of this file
. $DOTFILES_DIR/.zsh_utilities/private.sh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh