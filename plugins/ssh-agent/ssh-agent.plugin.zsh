# Based on code from Joseph M. Reagle
# http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html


# We're being passed an agent socket
[ -n "$SSH_CLIENT" -a -n "$SSH_AUTH_SOCK" ] && return 0

local SSH_ENV=$HOME/.ssh/environment
local OS=`uname`
local SSH_ADD_ARGS=""
[[ "$OS" == "Darwin" && "$SSH_AGENT_FROM_KEYCHAIN" == "1" ]] && local SSH_ADD=" -k"

function start_agent {
  /usr/bin/env ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
  chmod 600 ${SSH_ENV}
  . ${SSH_ENV} > /dev/null
  /usr/bin/ssh-add${SSH_ADD_ARGS};
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . ${SSH_ENV} > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi


