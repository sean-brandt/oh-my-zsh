#!/bin/zsh
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0
[ -f /usr/local/bin/brew ] || return 0

python_config=`brew list python |grep python-config |grep -v Frameworks`

if [ -f "$python_config" ]; then
  PYTHON_HOME=`$python_config --prefix`
  path=($PYTHON_HOME/bin $path)
fi
