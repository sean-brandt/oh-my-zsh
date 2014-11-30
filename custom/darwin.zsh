
[[ $(uname) != "Darwin" ]] && return 0

sh_load_status "Loading: $0"

#{{{ Darwin TEMP dir
typeset -x DARWIN_TEMP_DIR
DARWIN_TEMP_DIR=$(getconf DARWIN_USER_TEMP_DIR)
#}}}

#{{{ Darwin Temp Dir 

# set up SSH auth sock symlink for byobu
#test $SSH_AUTH_SOCK && ln -sf "$SSH_AUTH_SOCK" "${DARWIN_TEMP_DIR}/byobu.ssh-agent"

#}}}

#{{{ npm for node.js

[[ -d  /usr/local/share/npm/bin ]]  && path=($path  /usr/local/share/npm/bin)

#}}}


#{{{ spotlight based locate

function splocate() {
    if [ -s "$2" -a -d "$2" ] ; then
        args="$args -onlyin $2"
    fi
    mdfind $args "kMDItemDisplayName == '$1'wc"
}

function spgrep() {
    if [ -s "$2" -a -d "$2" ] ; then
        args="$args -onlyin $2"
    fi
    mdfind $args "$1" 
}

[[ "$SPLOCATE_AS_LOCATE" == "1" ]] && alias locate='splocate'

#}}}


#{{{ secure remove file / shred
[[ -x /usr/bin/srm ]] && alias shred='srm'
#}}}
