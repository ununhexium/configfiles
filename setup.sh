#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

ln -s "$SCRIPTPATH"/.resources ~/.resources
ln -s "$SCRIPTPATH"/.local/scripts ~/.local/scripts


