#!/bin/bash
export PATH=/opt/IBM/node-v6.7.0/bin:$PATH
npm install
npm install -g grunt-idra3

idra --publishbuildrecord --branch=$GIT_BRANCH --repositoryurl=$GIT_URL --commitid=$GIT_COMMIT --status=pass

idra --publishtestresult --filelocation=./tests/xunit.xml --type=unittest
idra --publishtestresult --filelocation=./tests/Cobertura.xml --type=code
