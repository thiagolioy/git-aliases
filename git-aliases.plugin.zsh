__define_git_completion () {
  eval "
      _git_$2_shortcut () {
          COMP_LINE=\"git $2\${COMP_LINE#$1}\"
          let COMP_POINT+=$((4+${#2}-${#1}))
          COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
          let COMP_CWORD+=1
          local cur words cword prev
         _get_comp_words_by_ref -n =: cur words cword prev
         _git_$2
      }
  "
}

__gitshortcut () {
    type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
    alias $1="git $2 $3"
    complete -o default -o nospace -F _git_$2_shortcut $1
}


# GIT
__gitshortcut  gp       push
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpod="git push origin devel"
__gitshortcut  gl       pull
alias glo="git pull origin"
alias glom="git pull origin master"
alias glod="git pull origin devel"
__gitshortcut  glr      pull --rebase
__gitshortcut  glro     pull '--rebase origin'
__gitshortcut  glrom    pull '--rebase origin master'
__gitshortcut  glrod    pull '--rebase origin devel'
__gitshortcut  gc       commit
__gitshortcut  gca      commit -a
__gitshortcut  gco      checkout
alias gcom="git checkout master"
alias gcod="git checkout devel"
__gitshortcut  gb       branch
__gitshortcut  gm       merge
__gitshortcut  gs       status
__gitshortcut  gd       diff
__gitshortcut  ga       add
__gitshortcut  gf       fetch
__gitshortcut  gr       reset
__gitshortcut  gst      stash
alias gstp="git stash pop"
alias gmm="git merge master"
alias gmd="git merge devel"
alias grs="git reset --soft"
alias grh="git reset --hard"
