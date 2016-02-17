pull_or_push() {
  if [ $# -eq 2 ]; then
    git $1 $2 `git rev-parse --abbrev-ref HEAD`
  else
    git $1 origin `git rev-parse --abbrev-ref HEAD`
  fi
}
pull() { pull_or_push "pull" $@ }
push() { pull_or_push "push" $@ }

alias gf='git fetch'
alias gpo="git push origin"
alias gpom="git push origin master"
alias glo="git pull origin"
alias glom="git pull origin master"
alias gb='git branch'
alias grh='git reset --hard'
alias glog="git log --oneline --decorate"

status() {
  if [ "$GIT_ALIASES_SHORTER_GIT_STATUS" -ne 1 ]; then; git status
  else; git status -sb; fi
}
alias gs='status'

co() {
  git fetch
  git checkout "$1"
  if [ "$GIT_ALIASES_SILENCE_GIT_STATUS" -ne 1 ]; then; git status; fi
}
compdef _git co=git-checkout

cob() {
  git checkout -b "$1"
  if [ "$GIT_ALIASES_AUTOPUSH_NEW_BRANCH" -eq 1 ]; then
    git add "$(git rev-parse --show-toplevel)" && git commit -a -m "Started $1" && push
  fi
}

cobm() {
  git checkout master && pull && git checkout -b "$1"
}

corbm() {
  corp master && git checkout -b "$1"
}

cop() {
  git fetch && git checkout "$1" && pull && git fetch
  if [ "$GIT_ALIASES_SILENCE_GIT_STATUS" -ne 1 ]; then; git status; fi
}
compdef _git cop=git-checkout


corp() {
  co "$1" && rp
}
compdef _git corp=git-checkout




gd() {
  if [ "$GIT_ALIASES_ICDIFF" -eq 1 ]; then; git icdiff
  elif [ "$GIT_ALIASES_ICDIFF" -eq 2 ]; then; git difftool --extcmd icdiff
  else; git diff; fi
  git status
}


prune() {
  git branch -D "$1" && git push origin --delete "$1"
}
