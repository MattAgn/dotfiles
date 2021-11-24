
alias dotfiles="cd ~/.dotfiles"

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

### Mobile ###
alias rnand="react-native run-android"
alias rnios="react-native run-ios"
alias emuand="/Users/matthieu/Library/Android/sdk/emulator/emulator @Pixel_2 </dev/null &>/dev/null &"

### WorkoutApp ###
alias woap="cd ~/projects/woap/WorkoutApp"
alias woaps="cd ~/projects/woap/WorkoutServer"


### Snake flutter ###
alias snake="cd ~/projects/snake_game"

### USI ###
alias usiapp="cd /Users/matthieu/projects/usi/usi-protocols"

### CodeName ###
alias cname="cd /Users/matthieu/projects/elixirLearning/code_name"

### Inshallah ###
alias ins="cd ~/projects/bam/inshallah/InshAllah-App"
alias inss="cd ~/projects/bam/inshallah/InshAllah-Server"
alias insw="cd ~/projects/bam/inshallah/InshAllah-Web"
alias insi="cd ~/projects/bam/inshallah/Inshallah-Infra"
alias insc="cd ~/projects/bam/inshallah/inshallah-client"
alias dc="docker-compose -f docker-compose.dev.yml up --force-recreate"
alias mi="make install"
alias mb="make build"
alias mspmt="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-payment"
alias msuser="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-user"
alias msmigration="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-migration"
alias msphoto="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-photo"
alias mssettings="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-settings"
alias msprofile="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-public-profile"
alias msaccount="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-account"
alias mssupport="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-support"
alias mssession="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-session"
alias msevent="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-eventstore"
alias msinter="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-interaction"
alias apigtw="cd ~/projects/bam/inshallah/InshAllah-Server/packages/api-gateway"
alias msalgo="cd ~/projects/bam/inshallah/InshAllah-Server/packages/microservice-algorithm"
alias ums="cd ~/projects/bam/inshallah/InshAllah-Server/packages/utils-microservice"
alias igrpc="cd ~/projects/bam/inshallah/InshAllah-Server/packages/interface-grpc"

### PUMP ###
alias pump="cd /Users/matthieu/projects/bam/pmu/pump"
alias flight="cd /Users/matthieu/projects/bam/pmu/flight"
alias pbiz="cd /Users/matthieu/projects/bam/pmu/pmu-business-logic"
alias pco="cd /Users/matthieu/projects/bam/pmu/pmu-pco-fetch"
alias pnative="cd /Users/matthieu/projects/bam/pmu/pump/packages/native"
alias pshared="cd /Users/matthieu/projects/bam/pmu/pump/packages/shared"
alias pweb="cd /Users/matthieu/projects/bam/pmu/pump/packages/web"
alias start_vpn="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias kiil_vpn="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias grdev="g pull --rebase origin dev && yarn"
alias ywn="yarn workspace native"
alias yws="yarn workspace shared"
alias yww="yarn workspace web"
alias yw="yww dev:spa"
alias yns="ywn start"

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
alias gplr="gpl --rebase origin"
alias gra="g rebase --abort"
alias grs="g rebase --skip"
alias grc="g rebase --continue"

### Docker ###
alias dps="docker ps"
alias dcup="docker-compose up"

### Elixir ###
alias dcmix="docker-compose run server mix"