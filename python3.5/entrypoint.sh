#!/bin/bash

VIRTUALENV="/data/py3env/"

if [ ! -d "$VIRTUALENV" ]; then
    echo "Creating a new virtualenv in 'py3env/'"
    pyvenv $VIRTUALENV
fi

. $VIRTUALENV/bin/activate
cd /data
echo "$@"
$@
