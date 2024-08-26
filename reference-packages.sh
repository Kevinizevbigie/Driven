
## ==========================
## Nuget Packages for Domain
## ==========================

DOMAINPROJECTFILE=$DOMAINROOT/$app.Domain.csproj
cd $DOMAINROOT

dotnet add package MediatR.Contracts

## ==========================
## Nuget Packages & references for Application
## ==========================

APPLICATIONPROJECTFILE=$APPROOT/$app.Application.csproj
cd $APPROOT

dotnet add package Dapper
dotnet add package FluentValidation
dotnet add package FluentValidation.DependencyInjectionExtensions
dotnet add package MediatR
dotnet add package Microsoft.Extensions.Logging.Abstractions

dotnet add $APPLICATIONPROJECTFILE reference $DOMAINPROJECTFILE

## ==========================
## Nuget Packages & references for Infrastructure
## ==========================

INFRASTRUCTUREPROJECTFILE=$INFRAROOT/$app.Infrastructure.csproj
cd $INFRAROOT
dotnet add package EFCore.NamingConventions
dotnet add package Microsoft.Extensions.Configuration.Abstractions
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL

dotnet add $INFRASTRUCTUREPROJECTFILE reference $DOMAINPROJECTFILE
dotnet add $INFRASTRUCTUREPROJECTFILE reference $APPLICATIONPROJECTFILE

## ==========================
## Nuget Packages & references for Presentation
## ==========================

PRESPROJECTFILE=$PRESROOT/$app.Api.csproj

cd $PRESROOT
dotnet add package MediatR
dotnet add package Microsoft.EntityFrameworkCore.Tools

## ref application and infra
dotnet add $PRESPROJECTFILE reference $APPLICATIONPROJECTFILE
dotnet add $PRESPROJECTFILE reference $INFRASTRUCTUREPROJECTFILE

cd $PROJECTROOT
