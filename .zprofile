######################################## Begin Shell Env (including $PATH) ########################################

# Hombrew
# Note that if you are using Oh My Zsh, it will call compinit for you when you source oh-my-zsh.sh.
# In this case, make sure eval "$(brew shellenv)" is called before sourcing oh-my-zsh.sh
# for Apple silicon
# eval "$(/opt/homebrew/bin/brew shellenv)"
# for Intel processor
eval "$(/usr/local/bin/brew shellenv)"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# golang
export PATH="$GOPATH/bin:$PATH"

# java
# switch between different JDK versions
function javahome {
  unset JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1");
  java -version
}

# rust
. "$HOME/.cargo/env"

# rbenv
# should be placed after rust environment
eval "$(rbenv init - --no-rehash zsh)"

# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# fnm
# node should be placed after python environment
eval "$(fnm env --use-on-cd --shell zsh)"

# mise
# should be placed at the last
eval "$(mise activate zsh)"

# user-specific executable files
export PATH="$HOME/.local/bin:$PATH"

# CMake App (cmake)
export PATH="$PATH:/Applications/CMake.app/Contents/bin"

# CotEditor (cot)
export PATH="$PATH:/Applications/CotEditor.app/Contents/SharedSupport/bin"

# Kaleidoscope (ksdiff)
export PATH="$PATH:/Applications/Kaleidoscope.app/Contents/MacOS"

# Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

######################################## End Shell Env (including $PATH) ########################################
