autoload -Uz is-at-least                                                                                                                                                            
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

alias gfa='git fetch -a'

alias gaa='git add -A'
alias gcm='git commit -m "$1"'
alias gph='git push'


alias glg='git lg --no-merges --author-date-order'
alias glgdate='git log -1 --format="%ad" --'

alias gpr='git pull --rebase' 
alias gpra='git pull --rebase --autostash'

alias gs='git show'
alias gsn='git show  --name-only'

alias gds='git diff --stat --name-only'

alias gshu='git stash save '"$1"' -u'
alias gshp='git stash push -m "$1"  file'

alias gsw='git switch'
alias gswt='git switch --detach'


gbrp() {
	git remote prune origin
	git branch -vv | awk '/: gone]/{print $1}' | xargs -r git branch -D
}

gslist() {
	git log --name-only --format=tformat: $1..$2 | sort | uniq

}

glghead() {
	git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10

}


