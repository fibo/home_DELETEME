source ~/.shell/profile

# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/.bash/yyyymmdd/yyyymmdd.sh

# Prompt displays git branch.

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

export PS1="\u@\h \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

source ~/.bash/gh-clone/fun.sh

# How to use an ssh-agent:
#
# 1. Create an ssh key, see
#
#    http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
#    but, do NOT leave the passphrase empty.
#
# 2. Copy script
#
#    from ~/.bash/ssh-agent
#    to ~/.ssh/agent
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

source ~/.bash/dir/fun.sh

NPM_CONFIG_PREFIX=~/.npm-global
mkdir -p $NPM_CONFIG_PREFIX
export NPM_CONFIG_PREFIX
export PATH=${NPM_CONFIG_PREFIX}/bin:$PATH

source ~/.bash/completion/npm
source ~/.bash/completion/git-completion.bash

# Load local profile, if any.
if [ -f ~/.local.bashrc ]; then
	source ~/.local.bashrc
fi

