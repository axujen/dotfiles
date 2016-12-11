# vim: ft=sh
## Env variables

# Initiate envoy variables
[ -x /usr/bin/envoy ] && eval `envoy -p`

# Terminal
[ -x /usr/bin/urxvt ] && TERMINAL="urxvt" || TERMINAL="xterm"
export TERMINAL

# vim for everything
export VISUAL="vim"
export EDITOR="vim"

# Modify the prompt for the ranger shell
[ -n "$RANGER_LEVEL" ] && PS1="$PS1"' (in ranger) '

# PATH
export PATH=$HOME/.local/bin:/usr/sbin:/sbin:$PATH

# Append local mandir to manpath
export MANPATH=$MANPATH:~/.local/share/man/

# Pager
export PAGER="less"
