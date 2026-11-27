#!/bin/bash

# Restore NuGet packages first: runprebuild copies some of them into bin/.
nuget restore Halcyon.sln

if [ -x runprebuild.sh ]; then
    ./runprebuild.sh || exit 1
fi

msbuild /p:DefineConstants="_MONO_CLI_FLAG_" Halcyon.sln
