local OS=`uname`
JAVA_VERSION="${JAVA_VERSION:=1.7}"
[[ "$OS" == "Darwin" && -z "$JAVA_HOME" ]] && export JAVA_HOME="$(/usr/libexec/java_home -v $JAVA_VERSION)"

path=($JAVA_HOME/bin $path)


function switchJava() {
  old_java_home=$JAVA_HOME
  export JAVA_VERSION=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)
  PATH=$(echo $PATH | perl -pi -e "s@(:)?$old_java_home/bin(:)?@@" | perl -pi -e 's@::@:@g')
  export PATH=$JAVA_HOME/bin:$PATH
  echo "New JAVA_HOME=$JAVA_HOME; new PATH=$PATH"
}
