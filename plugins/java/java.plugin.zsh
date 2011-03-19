local OS=`uname`
JAVA_VERSION="${JAVA_VERSION:=1.7}"
[[ "$OS" == "Darwin" && -z "$JAVA_HOME" ]] && export JAVA_HOME="$(/usr/libexec/java_home --version $JAVA_VERSION)"

path=($JAVA_HOME/bin $path)
