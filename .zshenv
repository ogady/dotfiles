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

export PATH="/opt/homebrew/bin:$PATH"

export PATH=$HOME/.nodebrew/current/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

export PATH="/usr/local/bin:$PATH"

# https://zenn.dev/bun913/articles/m1-mac-terraform-unstable
export GODEBUG=asyncpreemptoff=1

# https://krew.sigs.k8s.io/docs/user-guide/setup/install/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="$HOME/dev/bin:$PATH"
