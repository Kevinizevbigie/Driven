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


# Run Script
. $SCRIPTROOT/setup/1.make-solution.sh

# Run Script
. $SCRIPTROOT/setup/2.create-projects.sh

# create layer paths
DOMAINROOT=$PROJECTROOT/src/$app.Domain
APPROOT=$PROJECTROOT/src/$app.Application
INFRAROOT=$PROJECTROOT/src/$app.Infrastructure
PRESROOT=$PROJECTROOT/src/$app.Api

# remove default class from classlib dirs
rm $DOMAINROOT/*.cs $APPROOT/*.cs $INFRAROOT/*.cs

# Run Script
. $SCRIPTROOT/setup/3.update-solution.sh

# Run Script
. $SCRIPTROOT/setup/4.copy-generic.sh

# Project file variables
DOMAINPROJECTFILE=$DOMAINROOT/$app.Domain.csproj
APPLICATIONPROJECTFILE=$APPROOT/$app.Application.csproj
INFRASTRUCTUREPROJECTFILE=$INFRAROOT/$app.Infrastructure.csproj
PRESPROJECTFILE=$PRESROOT/$app.Api.csproj

# Run Script
. $SCRIPTROOT/setup/5.reference-packages.sh

TESTFOLDER=$PROJECTROOT/test


. $SCRIPTROOT/setup/6.test-setup.sh
