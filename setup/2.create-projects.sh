
#!/bin/bash

cd $PROJECTROOT/src

dotnet new classlib -n $app.Domain
dotnet new classlib -n $app.Application
dotnet new classlib -n $app.Infrastructure
dotnet new webapi -n $app.Api -controllers true

cd $SCRIPTROOT
