# vim: ft=sh
## Misc shell config

# MOTD is my todo
command -v todo.sh &> /dev/null && td ls | sed '/--/d' | sed '/TODO:/d' | sort

# search zshall manpage
zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# ssh into tmux
ssht() {
	ssh $* -t 'start-tmux || tmux a || tmux || /bin/zsh || /bin/bash'
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Show me when im in a net shell
groups | grep -qo internet && PS1="$PS1(NET) "
