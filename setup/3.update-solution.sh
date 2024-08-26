#!/bin/bash

SLNFILE=$app.sln

cd $PROJECTROOT
dotnet sln $SLNFILE add $DOMAINROOT
dotnet sln $SLNFILE add $APPROOT
dotnet sln $SLNFILE add $INFRAROOT
dotnet sln $SLNFILE add $PRESROOT
cd $SCRIPTROOT
