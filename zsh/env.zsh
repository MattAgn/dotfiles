# for kubernetes
export TILLER_NAMESPACE=tiller

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
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
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"# Podsexport PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export FZF_BASE="/opt/homebrew/bin/fzf"

# PUMP
export USE_API_PROXY=true
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true