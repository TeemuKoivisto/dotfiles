export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#export GOROOT=/usr/local/Cellar/go/1.17.8
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

source ~/.zfuncs
