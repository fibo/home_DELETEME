
# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export EDITOR=vim

if [ -f ~/.software/etc/profile ]; then
	source ~/.software/etc/profile
fi

source ~/.aliases

