# Fix fuckin keys in urxvt
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode # Path to your oh-my-zsh configuration.

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gentoo"
plugins=(git)
source $ZSH/oh-my-zsh.sh


export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.bin
export projects=~/Documents/projects
export docs=~/Documents

# User specific aliases and functions
alias v="vim"
alias rm="rm -i"
alias ungun="tar xvzf"
alias pkg-count="pacman -Qe | cut -d ' ' -f1 | wc -l"
