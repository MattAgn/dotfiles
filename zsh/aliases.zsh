
alias dot="cd ~/.dotfiles"

### VSCode ###
alias co="code ."

### Node ###
alias s="git stash && git co staging && git pull && yarn"
alias m="git stash && git co master && git pull && yarn"
alias ys="yarn start"
alias yt="yarn test"
alias yl="yarn lint"
alias yb="yarn build"
alias ybw="yarn build:watch"
alias ylf="yarn lint:fix"

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
alias mssession="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-session"
alias msevent="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-eventstore"
alias msinter="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-interaction"
alias apigtw="cd ~/projects/inshallah/InshAllah-Server/packages/api-gateway"
alias msalgo="cd ~/projects/inshallah/InshAllah-Server/packages/microservice-algorithm"
alias ums="cd ~/projects/inshallah/InshAllah-Server/packages/utils-microservice"
alias igrpc="cd ~/projects/inshallah/InshAllah-Server/packages/interface-grpc"


### Git ###
alias gcb="git co -b"
alias gz="g cz"
alias gci="g ci -m"
alias gap="g add -p"
alias gs="git stash"
alias gsp="git stash pop"
alias gpf="git push --force-with-lease"

### Docker ###
alias dps="docker ps"

