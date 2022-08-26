#!/bin/zsh

sed -i '.bak' -e "s/name = /name = ${1}/" ./.gitconfig
sed -i '.bak' -e "s/email = /email = ${2}/" ./.gitconfig
