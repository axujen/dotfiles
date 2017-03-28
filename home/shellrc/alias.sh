# vim: ft=sh
## Aliases

# Gentoo aliases
if [ -d /etc/portage ]; then
	alias emerge="emerge -av";
fi

# Debian aliases
if [ -d /etc/apt ]; then
	alias apti="apt-get install";
	alias aptp="apt-get purge";
	alias aptr="apt-get remove";
	alias aptss="aptitude search";
	alias aptu="apt-get update";
	alias aptup="apt-get upgrade";
    apts() {
        apt-cache search "$@" | sort
    }
fi

# Archlinux aliases
if [ -d /etc/pacman.d ]; then
	# Lists pacman packages sorted by size
	alias pac-list='expac -HM "%011m\t%-20n\t%10d" $( comm -23 <(pacman -Qqen|sort) <(pacman -Qqg base base-devel|sort) ) | sort -rn'

	# Pacman aliases
	alias pac='pacman'
	alias pacs='pacman -Ss'
	alias paci='pacman -S'
	alias pacup='pacman -Syu'
	alias pacr='pacman -Rs'

	# Packer aliases
	alias packer='TMPDIR=$HOME/packertmp packer --noedit'
	alias pak='packer'
	alias paks='packer -Ss'
	alias paki='packer -S'
	alias pakup='packer -Syu --auronly'
	alias pakr='pacman -Rs'
fi

# Optware
if [ -d /data/optware-ng  ]; then
    alias ipkg-search='/opt/bin/ipkg list | grep -i'
    alias ipks='ipkg-search'
    alias ipki='ipkg install'
    alias ipkr='ipkg remove'
    alias ipku='ipkg update'
    alias ipkup='ipkg upgrade'
fi

# General aliases
alias beep="echo -e '\a'"
alias grep='grep --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --group-directories-first --color=always -h'
alias mirror='H="--header"; wget $H="Accept-Language: en-us,en;q=0.5" $H="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" $H="Connection: keep-alive" -U "Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/20100101 Firefox/10.0.2" --referer=http://www.askapache.com/ -Emrkp -nc -np'
alias p='ps aux|grep -i --color=auto'
alias sl="ls"
alias sudo='sudo '
alias svim='sudo -e'
alias tmux='tmux -2'
alias utop="htop -u $USER"
alias awesome-quit="echo \"awesome.quit()\" | awesome-client"
alias steam="steam -silent"
alias netshell="sudo -g internet $SHELL"
alias px="proxychains -q"
alias ssh="ssh -o StrictHostKeyChecking=no"

# todotxt
alias td="todo.sh -Ant"
alias tdl="td ls | sed '/--/d' | sed '/TODO:/d' | sort"

# Upload using limf
upload()
{
    url=$(limf -c 12 -l $1)
    echo "$url" | xclip -selection c
    echo "$url"
}

command -v logtail >/dev/null 2>&1 && alias logs='sudo tail -F /var/log/messages | logtool -t short -n' || alias logs='sudo tail -F /var/log/messages'
command -v xclip >/dev/null 2>&1 && alias wgetpaste='wgetpaste -C'
# Throttle all steam games
command -v cpulimit &> /dev/null && alias steam="cpulimit -l 80 -i -z steam"

# If udevil is installed use it.
if [ -d /etc/udevil ]; then
	alias dmount='udevil mount'
	alias dumount='udevil umount'
fi
