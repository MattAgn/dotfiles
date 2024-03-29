# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/zsh/env.zsh
source ~/dotfiles/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle rupa/z
antigen bundle fzf
antigen bundle fzf-emulator
antigen bundle wfxr/forgit
antigen bundle wfxr/emoji-cli
antigen bundle zsh-autocomplete
antigen bundle tarruda/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting


antigen theme romkatv/powerlevel10k

antigen apply


source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/aliases.zsh


##### NVM ######
# source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### NFM 
eval "$(fnm env)"


##### GOOGLE CLOUD & KUBERNETES CONFIG ######
# kube aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }


# Setup travis
[ -f /Users/matthieu/.travis/travis.sh ] && source /Users/matthieu/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NVM 
 export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(fnm env --use-on-cd)"

# RBENV
type rbenv > /dev/null
if [ "$?" = "0" ]; then
    eval "$(rbenv init -)"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



source /Users/matthieu/.docker/init-zsh.sh || true # Added by Docker Desktop

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matthieu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matthieu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matthieu/google-cloud-sdk/completion.zsh.inc'; fi
