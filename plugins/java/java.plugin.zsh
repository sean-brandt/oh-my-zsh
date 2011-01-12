local OS=`uname`
[[ "$OS" == "Darwin" && -x /Library/Java/Home && -z "$JAVA_HOME" ]] && export JAVA_HOME="$(/usr/libexec/java_home)"

path=($JAVA_HOME/bin $path)



