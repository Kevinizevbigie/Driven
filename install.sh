#!/bin/bash

read -p "What is the name of the applicaton? " app

## the location where your dotnet project will live
PROJECTROOT=~/projects/DotNet/$app

# This script
SCRIPTROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ ! -d $PROJECTROOT ]; then
    mkdir -p $PROJECTROOT/src
    mkdir -p $PROJECTROOT/tests
else
    echo "This app already exists"
    exit 1
fi


## Source modules

. $SCRIPTROOT/setup/1.make-solution.sh

exit
. $SCRIPTROOT/setup/2.create-projects.sh
. $SCRIPTROOT/setup/3.update-solution.sh
. $SCRIPTROOT/setup/4.copy-generic.sh
. $SCRIPTROOT/setup/5.reference-packages.sh
