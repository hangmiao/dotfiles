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
alias brc='bundle exec rubocop -a'

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
alias tpl="terraform plan | landscape"
alias ts="terraform show"
alias ta="terraform apply"
alias tal="terraform apply | landscape"


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
