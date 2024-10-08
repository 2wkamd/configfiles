
#
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij --layout compact
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Use vi keybindings even if our EDITOR is set to vi
bindkey -e

#setopt histignorealldups sharehistory

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

source <(/usr/local/bin/kubectl completion zsh)



### Added by Zinit's installer
#if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#        print -P "%F{33} %F{34}Installation successful.%f%b" || \
#        print -P "%F{160} The clone has failed.%f%b"
#fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
#zinit light-mode for \
#    zdharma-continuum/zinit-annex-as-monitor \
#    zdharma-continuum/zinit-annex-bin-gem-node \
#    zdharma-continuum/zinit-annex-patch-dl \
#    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth"1" as"theme" 
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions  
zinit light junegunn/fzf
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet /home//gitp.zsh

export EDITOR=nvim
export SUDO_EDITOR=nvim


export SDKMAN_DIR="/home//ten/sdkman"
[[ -s "/home//ten/sdkman/bin/sdkman-init.sh" ]] && source "/home//ten/sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
#eval "$(zellij setup --generate-auto-start zsh)"
eval "$(zellij setup --generate-auto-start zsh)"
