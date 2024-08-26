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


. $SCRIPTROOT/setup/1.make-solution.sh

. $SCRIPTROOT/setup/2.create-projects.sh

# create layer paths
DOMAINROOT=$PROJECTROOT/src/$app.Domain
APPROOT=$PROJECTROOT/src/$app.Application
INFRAROOT=$PROJECTROOT/src/$app.Infrastructure
PRESROOT=$PROJECTROOT/src/$app.Api

# remove default class from classlib dirs
rm $DOMAINROOT/*.cs $APPROOT/*.cs $INFRAROOT/*.cs

. $SCRIPTROOT/setup/3.update-solution.sh

exit
. $SCRIPTROOT/setup/4.copy-generic.sh
. $SCRIPTROOT/setup/5.reference-packages.sh
