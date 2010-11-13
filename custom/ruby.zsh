#!/bin/zsh
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0

# {{{ Ruby libraries

[[ "$ZSH_VERSION_TYPE" == 'old' ]] || typeset -T RUBYLIB rubylib
typeset -U rubylib
export RUBYLIB
rubylib=( 
          ~/lib/[r]uby{/site_ruby,}{/1.*,}{/i?86*,}(N)
          ~/lib/[r]uby(N)
          $rubylib
         )
[[ "$ZSH_VERSION_TYPE" == 'old' ]] && RUBYLIB="${(j/:/)rubylib}"

# }}}
