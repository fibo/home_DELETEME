source ~/.shell/profile

# Shell prompt
###
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b · '
setopt PROMPT_SUBST
PROMPT='${vcs_info_msg_0_}%2~ '

# Misc
###
# enable bash like comments in shell
setopt interactivecomments

# Load local profile, if any.
if [ -f ~/.local.zshrc ]; then
	source ~/.local.zshrc
fi

