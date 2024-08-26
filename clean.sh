#!/bin/bash

read -p "what do you want to call the sln file? " sln
read -p "What is the name of the applicaton? " app

ROOT=~/projects/DotNet

if [ ! -d $ROOT/$app ]; then
    mkdir $ROOT/$app
    PROJECTROOT=$ROOT/$app
else
    echo "This app already exists"
    exit 1
fi

# stay in the root folder of project
cd $PROJECTROOT
mkdir src test

## Source modules

SCRIPTSFOLDER=/home/vinn/.debfiles/scripts/Programming/dotnet/make-dotnet

. $SCRIPTSFOLDER/make-solution.sh
. $SCRIPTSOLDER/create-projects.sh
. $SCRIPTSOLDER/update-solution.sh
. $SCRIPTSOLDER/copy-generic.sh
. $SCRIPTSOLDER/reference-packages.sh








