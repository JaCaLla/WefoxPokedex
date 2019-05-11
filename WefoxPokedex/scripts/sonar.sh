#!/bin/bash

#Start sonar server
pushd /Users/javiercalatrava/sonarqube-7.3/bin/macosx-universal-64
./sonar.sh start
popd


# Execute Sonar
sonar-scanner

LOCAL_IP=`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'| head -n 1`
echo "${LOCAL_IP}:9000"

open -a "Google Chrome" http://${LOCAL_IP}:9000/dashboard?id=WefoxPokedex
