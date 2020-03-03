# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

antigen theme romkatv/powerlevel10k

antigen apply

source ~/.dotfiles/zsh/env.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/aliases.zsh


##### NVM ######
source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### NFM 
eval "$(fnm env --multi)"


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
