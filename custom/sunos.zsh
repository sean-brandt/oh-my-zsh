
[[ $(uname) != "SunOs" ]] && return 0

sh_load_status "Loading: $0"

[[ -x /usr/bin/gfind ]] && alias find='gfind'
[[ -x /usr/bin/gxargs ]] && alias xargs='gxargs'

path=(  /usr/ucb
	$path 
	/usr/sfw/bin
	/usr/ccs/bin
        /usr/perl5/bin
        /usr/mysql/bin
	)

stty -istrip

