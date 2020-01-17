# for kubernetes
export TILLER_NAMESPACE=tiller

export ANDROID_HOME=$HOME/Library/Android/sdk

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
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"