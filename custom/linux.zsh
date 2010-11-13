[[ $(uname) != "Linux" ]] && return 0

sh_load_status "Loading: $0"

#{{{ Don't use our LS_COLORS

unset LS_COLORS

#}}}
