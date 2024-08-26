#!/bin/bash

read -p "What is the name of the applicaton? " app

## the location where your dotnet project will live
PROJECTROOT=~/projects/DotNet/$app

# This script
SCRIPTROOT="$( dirname -- "${BASH_SOURCE[0]}" )"/setup

if [ ! -d $PROJECTROOT ]; then
    mkdir -p $PROJECTROOT/src
    mkdir -p $PROJECTROOT/tests
else
    echo "This app already exists"
    exit 1
fi


## Source modules

. $SCRIPTROOT/1.make-solution.sh

exit
. $SCRIPTROOT/2.create-projects.sh
. $SCRIPTROOT/3.update-solution.sh
. $SCRIPTROOT/4.copy-generic.sh
. $SCRIPTROOT/5.reference-packages.sh
