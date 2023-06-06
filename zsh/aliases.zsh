
alias dotfiles="cd ~/dotfiles"

### VSCode ###
alias co="code ."

### Node ###
alias s="git stash && git co staging && git pull && yarn"
alias m="git stash && git co master && git pull && yarn"
alias dev="git stash && git co dev && git pull && yarn"
alias ys="yarn start"
alias yt="yarn test"
alias ytw="yarn test --watch"
alias yj="yarn jest"
alias yjw="yarn jest --watch"
alias yl="yarn lint"
alias yb="yarn build"
alias ybw="yarn build:watch"
alias ylf="yarn lint:fix"
alias y="yarn"

### Opensource ###
alias rntl="cd ~/projects/opensource/react-native-testing-library"

### CookingCoach ###
alias cf="cd ~/projects/CookingSecondBrain/frontend"
alias cb="cd ~/projects/CookingSecondBrain/backend"

### BAM ###
alias rnweb="cd ~/projects/bam/RnWebPlayground"
alias ware="cd ~/projects/bam/react-native-warehouse"
alias enabler="cd ~/projects/bam/react-native-enabler"

### MONIWAN ###
alias mona="cd ~/projects/bam/moniwan/moniwan-app"
alias monios="cd ~/projects/bam/moniwan/moniwan-app/ios"
alias monand="cd ~/projects/bam/moniwan/moniwan-app/android"
alias monb="cd ~/projects/bam/moniwan/moniwan-backend"

### Git ###
alias gcb="git co -b"
alias gz="g cz"
alias gci="g ci -m"
alias gap="g add -p"
alias gs="git stash"
alias gsa="g add . && g stash"
alias gsp="git stash pop"
alias gpf="git push --force-with-lease"
alias gpl="git pull"
alias gr="git rebase"
alias gundo="g reset --soft HEAD~1"
alias gplr="gpl --autostash --rebase origin" 
alias gra="g rebase --abort"
alias grs="g rebase --skip"
alias grc="g rebase --continue"
alias gprune="git fetch --prune;git branch | grep -v dev | grep -v master | xargs git branch -D"
alias master="g co master && g pull && yarn"
alias main="g co main && g pull && yarn"

### Docker ###
alias dps="docker ps"
alias dcup="docker-compose up"

alias intel="arch -x86_64"



######## OLD PROJECTS ##########

### Inshallah ###
alias ins="cd ~/projects/bam/archived/inshallah/InshAllah-App"
alias inss="cd ~/projects/bam/archived/inshallah/InshAllah-Server"

### PUMP ###
alias pump="cd ~/projects/bam/archived/pmu/pump"
alias ppr="cd ~/projects/bam/archived/pmu/portail-partenaire-front"
alias pnative="cd ~/projects/bam/archived/pmu/pump/packages/native"
alias pios="cd ~/projects/bam/archived/pmu/pump/packages/native/ios"
alias pandroid="cd ~/projects/bam/archived/pmu/pump/packages/native/android"
alias pshared="cd ~/projects/bam/archived/pmu/pump/packages/shared"
alias pweb="cd ~/projects/bam/archived/pmu/pump/packages/web"

### DALMA ### 
alias dal="cd ~/projects/bam/archived/app-dalma-native"
