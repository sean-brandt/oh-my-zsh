function install-rvm() {
    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
}

##
# Setup RVM
##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session

# add rvm completion function to path
fpath=("$HOME/.rvm/scripts/zsh/Completion" $fpath)
autoload -U compinit
compinit -i

