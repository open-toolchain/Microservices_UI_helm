#!/bin/bash
export PATH=/opt/IBM/node-v6.7.0/bin:$PATH
npm install
npm install -g grunt-idra3

idra --publishtestresult --filelocation=./tests/xunit.xml --type=unittest
idra --publishtestresult --filelocation=./tests/Cobertura.xml --type=code
