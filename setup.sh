#!/bin/bash

set -e

if [ ! -e "$HOME/.oh-my-zsh" ]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
fi

# $0 is the name of the bash script.
CURDIR=$(pwd $0)
COMMONDIR="cross-platform"

if [ "$(uname)" == "Darwin" ]
then
	OSDIR="osx"
	FILES=$(find $OSDIR -depth 1)
	FILES+=" "$(find $COMMONDIR -depth 1)
elif [ "$(uname)" == "Linux" ]
then
	OSDIR="linux"
	FILES=$(find $OSDIR -maxdepth 1 -mindepth 1)
	FILES+=" "$(find $COMMONDIR -maxdepth 1 -mindepth 1)
fi

for CONF in $FILES
do
  SYSTEM_CONF=$(echo $CONF | sed "s~^$OSDIR/~$HOME/.~" | sed "s~^$COMMONDIR/~$HOME/.~")
  MY_CONF=$(echo $CONF | sed "s~^~$CURDIR/~")

  echo $SYSTEM_CONF
  echo $MY_CONF

  # If the symlink already exists
  if [[ -h "$SYSTEM_CONF" ]]
  then
    echo "Removing existing $SYSTEM_CONF"
    rm -rf $SYSTEM_CONF
  fi

  echo "SymLinking $MY_CONF ---> $SYSTEM_CONF"
  ln -s $MY_CONF $SYSTEM_CONF
done

