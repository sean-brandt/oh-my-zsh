#!/bin/zsh

#set -o xtrace 
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0

# {{{ What version are we running?

shell=zsh

if [[ $ZSH_VERSION == 3.0.<->* ]]; then ZSH_STABLE_VERSION=yes; fi
if [[ $ZSH_VERSION == 3.1.<->* ]]; then ZSH_DEVEL_VERSION=yes;  fi

ZSH_VERSION_TYPE=old
if [[ $ZSH_VERSION == 3.1.<6->* ||
      $ZSH_VERSION == 3.<2->.<->*  ||
      $ZSH_VERSION == 4.<->* ]]
then
  ZSH_VERSION_TYPE=new
fi

# }}}

# {{{ zdotdir

# ZDOTDIR is a zsh-ism but it's a good concept so we generalize it to
# the other shells.

# This allows us to have a good set of .*rc files etc. in one place
# and to be able to reuse that from a different account (e.g. root).

# We have to do some of this both here and in .shared_env to avoid
# a chicken and egg thing when looking for the right .shared_env.

zdotdir=${ZDOTDIR:-$HOME}
export ZDOTDIR="$zdotdir"
if [[ "$ZDOTDIR" == "$HOME" ]]; then
  zdotdirpath=( $ZDOTDIR )
else
  zdotdirpath=( $ZDOTDIR $HOME )
fi

zdotdirpath=($HOME/.home/sh/zsh $ZDOTDIR)

# }}}

[[ -e $zdotdir/.shared_env ]] && . $zdotdir/.shared_env

sh_load_status "$0"

setopt extended_glob


# {{{ path

sh_load_status "search paths"

typeset -U path # No duplicates

# notice nasty hack for old zsh
path=(  /{opt,usr}/local/bin /{opt,usr}/local/sbin /usr/sbin /sbin /[u]sr/X11R6/bin(N) /usr/local/mysql/bin ~/bin/local $path)
path=( $zdotdir/{[l]ocal/{s,}bin,[p]ackbin,{s,}[b]in,[b]in/{backgrounds,palm,shortcuts}}(N) $path )
path=( ~/.gem/ruby/1.8/bin $path )

# }}}
