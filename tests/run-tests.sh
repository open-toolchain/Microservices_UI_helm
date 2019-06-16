#!/bin/bash
ibmcloud login --apikey $IBM_CLOUD_API_KEY --no-region
ibmcloud doi publishtestrecord --logicalappname="$APP_NAME" --buildnumber=$BUILD_NUMBER --filelocation=./tests/xunit.xml --type=unittest
ibmcloud doi publishtestrecord --logicalappname="$APP_NAME" --buildnumber=$BUILD_NUMBER --filelocation=./tests/Cobertura.xml --type=code
