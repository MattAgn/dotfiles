
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

### Inshallah ###
alias ins="cd ~/projects/inshallah/InshAllah-App"
alias inss="cd ~/projects/inshallah/InshAllah-Server"
alias insw="cd ~/projects/inshallah/InshAllah-Web"
alias insi="cd ~/projects/inshallah/Inshallah-Infra"
alias insc="cd ~/projects/inshallah/inshallah-client"
alias dc="docker-compose -f docker-compose.dev.yml up --force-recreate"
alias mi="make install"
alias mb="make build"
alias mspmt="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-payment"
alias msuser="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-user"
alias msmigration="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-migration"
alias msphoto="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-photo"
alias mssettings="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-settings"
alias msprofile="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-public-profile"
alias msaccount="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-account"
alias mssupport="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-support"
alias mssession="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-session"
alias msevent="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-eventstore"
alias msinter="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-interaction"
alias apigtw="cd ~/projects/inshallah/InshAllah-Server/packages/api-gateway"
alias msalgo="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-algorithm"
alias ums="cd ~/projects/inshallah/InshAllah-Server/packages/utils-microservice"
alias igrpc="cd ~/projects/inshallah/InshAllah-Server/packages/interface-grpc"

### PUMP ###
alias pump="cd /Users/matthieu/projects/pmu/pump"
alias pbiz="cd /Users/matthieu/projects/pmu/pmu-business-logic"
alias pco="cd /Users/matthieu/projects/pmu/pmu-pco-fetch"
alias pnative="cd /Users/matthieu/projects/pmu/pump/packages/native"
alias pshared="cd /Users/matthieu/projects/pmu/pump/packages/shared"
alias pweb="cd /Users/matthieu/projects/pmu/pump/packages/web"
alias start_vpn="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias kiil_vpn="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias grdev="git co dev && git pull && g co - && g rebase dev"
alias ywn="yarn workspace native"
alias ywd="yarn workspace web"
alias yws="yarn workspace shared"

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

### Docker ###
alias dps="docker ps"
alias dcup="docker-compose up"

### Elixir ###
alias dcmix="docker-compose run server mix"