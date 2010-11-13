#!/bin/zsh
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0


# {{{ Specific to hosts

run_local_hooks .zshenv

# }}}

export CLICOLOR=1
#export LSCOLORS=gxfxcxexdxbebgdbdfgfge
#export LSCOLORS=cxfxexexDxexexDxDxcxcx


export GISTY_DIR=~/.gists

