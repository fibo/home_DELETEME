
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\u@\h \w \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export EDITOR=vim

if [ -f ~/.software/etc/profile ]; then
	source ~/.software/etc/profile
fi



##
# GitHub clone repo util.
#-----------------------+
#
# Clones repo under $HOME/github.com/$GITHUB_USER/$REPO_NAME and cd into it.
# GITHUB_USER is prompted once, if not already configured.
#
# @param {String} REPO_NAME

gh-clone() {
	REPO_NAME=$1

	GITHUB_DIR=$HOME/github.com
	GITHUB_USER=$(git config --global github.user)

	if [ -z "$GITHUB_USER" ]
	then
		read -s -p "Enter your github.user: " GITHUB_USER
		git config --global github.user $GITHUB_USER
	fi

	TARGET_DIR=$GITHUB_DIR/$GITHUB_USER
	mkdir -p $TARGET_DIR

	REPO_URL=git@github.com:$GITHUB_USER/${REPO_NAME}.git

	cd $TARGET_DIR
	git clone $REPO_URL && cd $REPO_NAME
}

source ~/.aliases

# How to use an ssh-agent:
#
# 1. Create an ssh key, see
#
#    http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
#    but, do NOT leave the passphrase empty.
#
# 2. Copy script from
#
#    https://help.github.com/articles/working-with-ssh-key-passphrases/
#
#    to ~/.ssh/agent
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

