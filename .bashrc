source ~/.shell/profile

# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Prompt displays git branch.

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

export PS1="\u@\h \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# To use an ssh-agent, create an SSH key. See
#
#    https://fibo.github.io/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

# Source utils.

source ~/.shell/dir/fun.sh
source ~/.shell/gh-clone/fun.sh

# Load local bash profile, if any.
if [ -f ~/.local/bashrc ]; then
	source ~/.local/bashrc
fi

