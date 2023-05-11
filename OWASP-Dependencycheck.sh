#!/bin/sh

pwd
ls -la
curl https://github.com/jeremylong/DependencyCheck/releases/download/v8.2.1/dependency-check-8.2.1-release.zip
unzip dependency-check-8.2.1-release.zip
ls
cd dependency-check/bin
bash dependency-check
