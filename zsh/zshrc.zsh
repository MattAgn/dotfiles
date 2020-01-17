source ~/.dotfiles/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle rupa/z
antigen bundle fzf
antigen bundle wfxr/forgit
antigen bundle wfxr/emoji-cli
antigen bundle tarruda/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

source ~/.dotfiles/zsh/env.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/aliases.zsh


##### NVM ######
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



##### GOOGLE CLOUD & KUBERNETES CONFIG ######
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matthieu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matthieu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/completion.zsh.inc'; fi

# kube aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }


# Setup travis
[ -f /Users/matthieu/.travis/travis.sh ] && source /Users/matthieu/.travis/travis.sh
