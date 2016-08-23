#!/bin/sh

export TERM=${TERM:-dumb}
echo "****** Starting"
cd source-code
./gradlew build
cp build/libs/*.jar ../build
echo "****** Finished"
