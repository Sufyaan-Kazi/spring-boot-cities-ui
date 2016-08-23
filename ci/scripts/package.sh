#!/bin/sh

export TERM=${TERM:-dumb}
echo "****** Starting"
cd cities-ui
./gradlew build
cp build/libs/*.jar ../build
echo "****** Finished"
