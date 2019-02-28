#!/bin/bash
export PATH=/opt/IBM/node-v4.2/bin:$PATH
npm install -g npm@3.7.2 ### work around default npm 2.1.1 instability
npm install
npm install -g grunt-idra3

idra --publishbuildrecord --branch=$GIT_BRANCH --repositoryurl=$GIT_URL --commitid=$GIT_COMMIT --status=pass

idra --publishtestresult --filelocation=./tests/xunit.xml --type=unittest
idra --publishtestresult --filelocation=./tests/Cobertura.xml --type=code