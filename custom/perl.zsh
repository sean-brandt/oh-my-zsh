#!/bin/zsh
# Allow disabling of entire environment suite
[ -n "$INHERIT_ENV" ] && return 0

# {{{ Perl libraries

[[ "$ZSH_VERSION_TYPE" == 'old' ]] || typeset -T PERL5LIB perl5lib
typeset -U perl5lib
export PERL5LIB
perl5lib=( 
          ~/{local/,}lib/[p]erl5{,/site_perl}(N)
          $perl5lib
         )
[[ "$ZSH_VERSION_TYPE" == 'old' ]] && PERL5LIB="${(j/:/)perl5lib}"

# }}}
