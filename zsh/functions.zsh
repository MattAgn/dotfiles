######################################################
##### GIT ######
#######################################################

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# Make PR
gpr() {
  cd $(git rev-parse --show-toplevel)
  TITLE=${1}
  MESSAGE=$(echo $TITLE'\n' | cat - ./PULL_REQUEST_TEMPLATE.md)
  hub pull-request -m "${MESSAGE}" --browse
}

# gcob - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
gcob() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# gcoci - checkout git commit with previews
gcoci() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# gri - interactive rebase
gri() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git rebase -i $(echo "$commit" | sed "s/ .*//")
}

# grsoft - soft reset
grsoft() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git reset --soft $(echo "$commit" | sed "s/ .*//")
}

# Commit all in a Work in progress commit
gwp() {
  git add .
  git ci -m ":construction: Work in progress"
}


######################################################
##### DOCKER ######
#######################################################

# Sh on a container
dsh() {
  docker ps | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} docker exec -it {} sh
}
# Remove container
drmc() {
  docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker rm
}
# Restart container
drsc() { 
  docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker restart
}
# Stop container
dstopc() {
  docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker stop
}


######################################################
##### Kubernetes ######
#######################################################

gstaging() {
  gcloud beta container clusters get-credentials gke-cluster-staging --region europe-west4 --project inshallah-staging
}

gprod() {
  gcloud beta container clusters get-credentials gke-cluster-production --region europe-west4 --project inshallah-production
}

gmigration() {
  gcloud beta container clusters get-credentials gke-cluster-migration --region europe-west4 --project inshallah-staging
}

# Sh on a kubernetes container
ksh() {
  kubectl get pods --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} kubectl exec -it --namespace=microservice {} sh
}
# Delete a pod
kdelpo() {
  kubectl get pods --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs kubectl delete --namespace=microservice po 
}
# Delete a job
kdeljo() {
  kubectl get jobs --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs kubectl delete --namespace=microservice jobs
}
# Describe a pod
kdspo() {
  kubectl get pods --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs kubectl describe --namespace=microservice po 
}
# Describe a job
kdsjo() {
  kubectl get jobs --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs kubectl describe jobs --namespace=microservice
}
# Get jobs
kgjo() {
  kubectl get jobs --namespace=microservice
}
# Port forward read
kpfdb() {
  kubectl get pods --namespace=microservice | grep "pgsql-read*" |  awk '{print $1}' | xargs -o -J {} kubectl port-forward --namespace=microservice {} 5433:5432 &
  kubectl get pods --namespace=microservice | grep "pgsql-eventstore*" |  awk '{print $1}' | xargs -o -J {} kubectl port-forward --namespace=microservice {} 5434:5432 &
  kubectl get pods --namespace=microservice | grep "pgsql-session*" |  awk '{print $1}' | xargs -o -J {} kubectl port-forward --namespace=microservice {} 5435:5432
}
# Port forward microservice
kpfms() {
  kubectl get pods --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} kubectl port-forward --namespace=microservice {} 54334:50051
}
# Get logs for a deployments (associated pods)
klog() {
  kubectl get deployments --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -I {} stern {} -c {} --namespace=microservice -o=raw --tail=25 | jq '.'
}
klograw() {
  kubectl get deployments --namespace=microservice | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -I {} stern {} -c {} --namespace=microservice -o=raw --tail=25 
}
# Get logs for api gtw
kloggtw() {
  kubectl get deployments --namespace=microservice | grep "api-gateway*"| awk '{print $1}' | xargs -o -I {} stern {} -c {} --namespace=microservice -o=raw --tail=25 | jq '.'
}
# Get logs for ms user
kloguser() {
  kubectl get deployments --namespace=microservice | grep "microservice-user*" | awk '{print $1}' | xargs -o -I {} stern {} -c {} --namespace=microservice -o=raw --tail=25 | jq '.'
}

######################################################
##### DIVERSE ######
#######################################################

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# Search dirs and cd to them
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}