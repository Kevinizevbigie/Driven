#!/bin/bash

SLNFILE=$sln.sln

dotnet sln $SLNFILE add $DOMAINROOT
dotnet sln $SLNFILE add $APPROOT
dotnet sln $SLNFILE add $INFRAROOT
dotnet sln $SLNFILE add $PRESROOT
