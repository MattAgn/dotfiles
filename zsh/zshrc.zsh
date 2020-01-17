 ######################################################
 ##### ZSH ######
 #######################################################

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthieu/.oh-my-zsh"


ZSH_THEME="robbyrussell"

plugins=(
  z
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


######################################################
##### PATH & VARIABLES ######
#######################################################
export TILLER_NAMESPACE=tiller
export ANDROID_HOME=$HOME/Library/Android/sdk
export FZF_DEFAULT_OPTS="--layout=reverse"

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

######################################################
##### ALIASES & FUNCTIONS ######
#######################################################

### VSCode ###
alias co="code ."

### Node ###
alias s="git stash && git co staging && git pull && yarn"
alias m="git stash && git co master && git pull && yarn"
alias ys="yarn start"
alias yt="yarn test"
alias yl="yarn lint"

### Mobile ###
alias rnand="react-native run-android"
alias rnios="react-native run-ios'"
alias emuand="/Users/matthieu/Library/Android/sdk/emulator/emulator @Pixel_3 </dev/null &>/dev/null &"


### Inshallah ###
alias ins="cd ~/projects/inshallah/InshAllah-App"
alias inss="cd ~/projects/inshallah/InshAllah-Server"
alias dc="docker-compose -f docker-compose.dev.yml up --force-recreate"


### Git ###
alias gcb="git co -b"
alias gz="g cz"
alias gci="g ci -m"
alias gap="g add -p"
alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# Make PR
gpr() {
  cd $(git rev-parse --show-toplevel)
  TITLE=${1}
  MESSAGE=$(echo $TITLE | cat - ./PULL_REQUEST_TEMPLATE.md)
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

# Commit all in a Work in progress commit
gwp() {
  git add .
  git ci -m ":construction: Work in progress"
}

### Docker ###

alias dps="docker ps"

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

### Kubernetes ###
# Sh on a kubernetes container
ksh() {
  kubectl get pods | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} kubectl exec -it {} sh
}
# Delete a pod
kdel() {
  kubectl get pods | awk 'NR>1' | fzf | awk '{print $1}' | xargs kubectl delete po 
}
# Port forward read
kpfdb() {
  kubectl get pods | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} kubectl port-forward {} 5433:5432
}
# Port forward microservice
kpfms() {
  kubectl get pods | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -J {} kubectl port-forward {} 54334:50051
}
# Get logs for a deployments (associated pods)
klog() {
  kubectl get deployments | awk 'NR>1' | fzf | awk '{print $1}' | xargs -o -I {} stern {} -c {} -o=raw --tail=25 | jq '.'
}


### Diverse ###
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

### Diverse ###

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

######################################################
##### NVM ######
#######################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


######################################################
##### GOOGLE CLOUD & KUBERNETES CONFIG ######
#######################################################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matthieu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matthieu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/completion.zsh.inc'; fi

# kube aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }


######################################################
##### SETUP ######
#######################################################
# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup travis
[ -f /Users/matthieu/.travis/travis.sh ] && source /Users/matthieu/.travis/travis.sh

# Setup Forgit
[ -f ~/.dotfiles/zsh/forgit.plugin.zsh ] && source ~/.dotfiles/zsh/forgit.plugin.zsh
