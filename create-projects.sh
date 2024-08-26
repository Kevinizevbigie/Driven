
#!/bin/bash
cd src
dotnet new classlib -n $app.Domain
dotnet new classlib -n $app.Application
dotnet new classlib -n $app.Infrastructure
dotnet new webapi -n $app.Api -controllers true

cd ..

# create layer paths
DOMAINROOT=$PROJECTROOT/src/$app.Domain
APPROOT=$PROJECTROOT/src/$app.Application
INFRAROOT=$PROJECTROOT/src/$app.Infrastructure
PRESROOT=$PROJECTROOT/src/$app.Api

## ==========================
# remove default class from classlib dirs
## ==========================

rm $DOMAINROOT/*.cs $APPROOT/*.cs $INFRAROOT/*.cs
