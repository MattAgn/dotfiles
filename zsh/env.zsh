# for kubernetes
export TILLER_NAMESPACE=tiller

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
export ANDROID_HOME=$HOME/Library/Android/sdk

export GCP_PROJECT="inshallah-staging"
export FZF_DEFAULT_OPTS="--layout=reverse"
export FORGIT_FZF_DEFAULT_OPTS="
  $FZF_DEFAULT_OPTS
  --ansi
  --height='80%'
  --reverse
  --preview-window='right:60%'
  $FORGIT_FZF_DEFAULT_OPTS
  "

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/flutter/bin
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# PUMP
export USE_API_PROXY=true
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true