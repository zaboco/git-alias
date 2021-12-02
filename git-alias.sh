alias ga='git add'
alias ga.='git add .'

alias gb='git branch'
alias gbd="git branch -D"

alias gf='git fetch'
alias gh='git checkout master' # deprecated - master will be replace with main
alias gn='git checkout main'
alias gw='git checkout -' # switch branches
alias gcb='git checkout -b'

alias gm='git commit --amend'
alias gmn='git commit --amend --no-edit'
alias gmna='git commit --amend --no-edit -a'

alias gmm='git merge master'
alias gmw='git merge -'

alias gd='git diff'
alias gds='git diff --staged'

alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gld="glda -5"
alias glda="git log --oneline --decorate"


alias gp='git push -u'
alias gpm='git push --mirror'
alias gul='git pull --all --prune'

alias gr='git reset '
alias grh='git reset --hard '
alias gro='git reset --hard origin/$(get_current_branch)'
alias grs='git reset --soft'
alias gu='git reset --soft HEAD~'

alias grm='git rebase master'
alias grw='git rebase -'

alias gs='git status --ignore-submodules'

alias gss='git stash -u'
alias gsi='git stash save -k -u'
alias gsp='git stash pop'


gc() {
  git commit -m "${*}"
}

gca() {
  git commit -am "${*}"
}

prune_local_branches() {
  git branch --merged \
    | grep -v "\*\|master" \
    | xargs -n 1 git branch -d
}

get_current_branch() {
  git rev-parse --abbrev-ref HEAD | tr -d '\n'
}

if [ -x "$(command -v pbcopy)" ]; then
  alias copy_current_branch="get_current_branch | pbcopy"
fi
