HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANGUAGE=pt_BR
export LC_ALL=pt_BR.UTF-8

source ~/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/.local/bin:$PATH

export FVM_HOME=$HOME/fvm
export PATH=$FVM_HOME/default/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH

export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

export PATH="$PATH":"$HOME/.pub-cache/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
alias la='ls --color=auto -lah'
alias vi='lvim'
alias vim='lvim'
alias dev='cd $HOME/Development'
alias meuip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias reload='source $HOME/.zshrc'
alias undo-git-reset-head="git reset 'HEAD@{1}'"
alias zshconfig='vim $HOME/.zshrc'

take() {
  mkdir "$1"
  cd "$1"
}

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

eval $(thefuck --alias)

[[ -s /home/guilherme/.autojump/etc/profile.d/autojump.sh ]] && source /home/guilherme/.autojump/etc/profile.d/autojump.sh

#autoload -U compinit && compinit -u
ZSH_COMPDUMP="$HOME/.cache/zsh/zcompcache"
ZSH_CACHE_DIR="$ZSH_COMPDUMP"

# Create the parent directory if it doesn't exist
[[ -d $ZSH_COMPDUMP ]] || mkdir -p $ZSH_COMPDUMP

_comp_files=($ZSH_COMPDUMP/zcompdump(Nm-20))
if (( $#_comp_files )); then
    autoload -Uz compinit -C -d "$ZSH_COMPDUMP/.zcompdump-${ZSH_VERSION}"
else
    autoload -Uz compinit -d "$ZSH_COMPDUMP/.zcompdump-${ZSH_VERSION}"
fi

fpath=(~/.zsh/zsh-completions/src $fpath)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
