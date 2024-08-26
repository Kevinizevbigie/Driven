#!/bin/bash

cd $TESTFOLDER

# Create test project
dotnet new xunit $app.Domain.UnitTests
cd $app.Domain.UnitTests

# reference the domain project
dotnet add $app.Domain.UnitTests.csproj reference ../../src/$app.Domain/$app.Domain.csproj

cd $TESTFOLDER

dotnet new xunit $app.Application.UnitTests
cd $app.Application.UnitTests
# Reference domain and application
dotnet add $app.Application.UnitTests.csproj reference ../../src/$app.Domain/$app.Domain.csproj
dotnet add $app.Application.UnitTests.csproj reference ../../src/$app.Application/$app.Application.csproj

cd $TESTFOLDER
dotnet new xunit $app.Infrastructure.UnitTests
cd $app.Domain.UnitTests
# Reference application and infra
dotnet add $app.Infrastructure.UnitTests.csproj reference ../../src/$app.Application/$app.Application.csproj
dotnet add $app.Infrastructure.UnitTests.csproj reference ../../src/$app.Infrastructure/$app.Infrastructure.csproj

cd $TESTFOLDER
dotnet new xunit $app.Api.UnitTests
cd $app.Domain.UnitTests
# Reference application and 
dotnet add $app.Api.UnitTests.csproj reference ../../src/$app.Application/$app.Application.csproj
dotnet add $app.Api.UnitTests.csproj reference ../../src/$app.Api/$app.Api.csproj

# dotnet new xunit $app.Domain.FunctionalTests
# dotnet new xunit $app.Application.FunctionalTests
# dotnet new xunit $app.Infrastructure.FunctionalTests
# dotnet new xunit $app.Api.FunctionalTests



