HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

export LANGUAGE=pt_BR
export LC_ALL=pt_BR.UTF-8

export PATH=$HOME/.local/bin:$PATH

alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
alias la='ls --color=auto -lah'
alias vi='lvim'
alias vim='lvim'
alias dev='cd $HOME/Development'
alias meuip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias reload='source $HOME/.zshrc'
alias zshconfig='vim $HOME/.zshrc'

take() {
  mkdir "$1"
  cd "$1"
}

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

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
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
