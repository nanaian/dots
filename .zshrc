source .profile

export PATH=~/bin:~/.cargo/bin:$PATH

autoload -Uz compinit
compinit

stty -ixon

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey '^A'    beginning-of-line
bindkey '^[[3~' delete-char
#bindkey ';2C'   forward-word
#bindkey ';2D'   backward-word

alias dots="git --git-dir=$HOME/dev/dots --work-tree=$HOME"

alias ls="exa --time-style long-iso"
alias l="exa --time-style long-iso -al"
alias la="exa --time-style long-iso -a"

alias firefox="firefox-developer-edition"
alias ff="firefox-developer-edition"

PROMPT="%F{green}%~%f $ "
