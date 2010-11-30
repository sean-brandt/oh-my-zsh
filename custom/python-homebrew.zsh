#!/bin/zsh
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0


PYTHON_HOME=$(python-config --prefix)
path=($PYTHON_HOME/bin $path)
