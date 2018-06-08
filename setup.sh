#!/bin/bash

set -e

if [ ! -e "$HOME/.oh-my-zsh" ]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
fi

# $0 is the name of the bash script.
CURDIR=$(pwd $0)

if [ "$(uname)" == "Darwin" ]
then
	OSDIR="osx"
elif [ "$(uname)" == "Linux" ]
then
	OSDIR="linux"
fi

COMMONDIR="cross-platform"
FILES=$(find $OSDIR -depth 1)
FILES+=" "$(find $COMMONDIR -depth 1)

for CONF in $FILES
do
  SYSTEM_CONF=$(echo $CONF | sed "s~^$OSDIR/~$HOME/.~" | sed "s~^$COMMONDIR/~$HOME/.~")
  MY_CONF=$(echo $CONF | sed "s~^~$CURDIR/~")

  echo $SYSTEM_CONF
  echo $MY_CONF

  if [[ -h "$SYSTEM_CONF" ]]
  then
    echo "Removing existing $SYSTEM_CONF"
    sudo rm -rf $SYSTEM_CONF
  fi

  echo "SymLinking $MY_CONF ---> $SYSTEM_CONF"
  ln -s $MY_CONF $SYSTEM_CONF
done

