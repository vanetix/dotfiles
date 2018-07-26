# Fix urxvt bindings
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode

# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="simple"
plugins=(git vagrant zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

# standard configuration
export EDITOR=vim

# user specific aliases and functions
alias v="nvim"
alias rm="rm -i"
alias gun="tar -czf"
alias ungun="tar -xvzf"
alias vup="vagrant up; vagrant ssh"
alias gdh="gd HEAD"
alias gt="git tag"
alias ggpusht="ggpush --tags"
alias gds="gd --staged"

# BSD utils suck
alias sed="gsed"
alias tar="gtar"

# Install thefuck
eval $(thefuck --alias f)

# Install asdf
source /usr/local/opt/asdf/asdf.sh

# Private keys added to keychain
ssh-add -KA ~/.ssh/id_rsa  &> /dev/null

export GOPATH=$HOME/Code/go
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export PATH=/usr/local/opt/openssl/bin:$HOME/.rvm/bin:$HOME/.bin:$HOME/.composer/vendor/bin:$GOPATH/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN=""
