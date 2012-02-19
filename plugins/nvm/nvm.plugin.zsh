function install-nvm() {
  git clone git://github.com/creationix/nvm.git ~/.nvm
}

##
# Setup NVM
##
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"  # This loads NVM into a shell session

