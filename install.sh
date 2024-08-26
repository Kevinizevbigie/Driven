#!/bin/bash

read -p "what do you want to call the sln file? " sln
read -p "What is the name of the applicaton? " app

## the location where your dotnet project will live
PROJECTROOT=~/projects/DotNet/$app

# This script
SCRIPTROOT="$( dirname -- "${BASH_SOURCE[0]}" )"/setup

mkdir -p $PROJECTROOT

echo $PROJECTROOT
echo $SCRIPTROOT

exit

if [ ! -d $ROOT/$app ]; then
    mkdir $ROOT/$app
    PROJECTROOT=$ROOT/$app
else
    echo "This app already exists"
    exit 1
fi


mkdir $PROJECTROOT/src
mkdir $PROJECTROOT/tests

## Source modules

. $SCRIPTROOT/1.make-solution.sh
. $SCRIPTROOT/2.create-projects.sh
. $SCRIPTROOT/3.update-solution.sh
. $SCRIPTROOT/4.copy-generic.sh
. $SCRIPTROOT/5.reference-packages.sh
