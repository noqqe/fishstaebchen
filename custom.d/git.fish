# Various git functions and aliases that make my life easier.

### Aliases

alias g='git'

# clone
function gc
  git clone $argv[1]
end

# adding
alias ga='git add'
alias gall='git add .'

# checkout new branch with tracking
alias gsc='git switch -c'

# status
alias gs='git status'
alias gl='git log -15 --oneline --decorate'
alias gll='git log --graph --pretty=oneline --abbrev-commit --decorate'

# diff
alias gd='git diff'
alias gdc='git diff --cached'

### Functions

# easy committing
function gcm
  git commit -a -m "$argv"
end

# semi intelligent pushing
function gp
  if test -z $argv
    set BRANCH (git rev-parse --abbrev-ref HEAD)
  else
    set BRANCH $argv[1]
  end
  git push origin $BRANCH
end

# Merge all commits from current branch
function gsquash
  set B main

  if git rev-parse --verify master
    set B master
  end

  git reset --soft (git merge-base $B HEAD)
  git commit
end

# Show branches by last committer 
# https://stackoverflow.com/a/39251131
alias gblc="git for-each-ref --format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)    %(align:25,left)%(color:yellow)%(authorname)%(end) %(color:reset)%(refname:strip=3)' --sort=authorname refs/remotes"
