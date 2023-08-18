# Set up the prompt - if you load Theme with zplugin as in this example, this will be overriden by the Theme. If you comment out the Theme in zplugins, this will be loaded.
#autoload -Uz promptinit
#promptinit
#prompt walters            # see Zsh Prompt Theme below

# Use vi keybindings even if our EDITOR is set to vi
bindkey -e

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
PROMPT_EOL_MARK=


if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

bindkey "^ " forward-word

# Use modern completion system
autoload -Uz compinit
compinit

#source <(/home/ /ten/GCP/google-cloud-sdk/bin/kubectl completion zsh)

eval "$(zoxide init zsh)"

# zplug - manage plugins
source ~/.zplug/init.zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
#zplug "plugins/sdk", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme
#zplug "~/.local_zshrc", from:local
# zplug - install/load new plugins when zsh is started or reloaded
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi
#zplug load --verbose
zplug load

export EDITOR=nvim

export SDKMAN_DIR="/home/ /ten/sdkman"
[[ -s "/home/ /ten/sdkman/bin/sdkman-init.sh" ]] && source "/home/ /ten/sdkman/bin/sdkman-init.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f '/home/ /ten/GCP/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ /ten/GCP/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/ /ten/GCP/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ /ten/GCP/google-cloud-sdk/completion.zsh.inc'; fi
