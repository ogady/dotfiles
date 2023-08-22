#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

##############
# export
##############

# go
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY="https://proxy.golang.org,direct"

# ghq
export GHQ_ROOT=$GOPATH/src
