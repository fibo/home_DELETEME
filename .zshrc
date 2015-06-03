# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt appendhistory beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fibo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# start antigen configuration
###############################################################################
source .zsh/antigen/antigen.zsh

antigen-use oh-my-zsh
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply
###############################################################################

source ~/.shell/aliases
source ~/.shell/profile

