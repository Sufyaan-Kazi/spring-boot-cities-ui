#!/bin/sh

export TERM=${TERM:-dumb}
echo "****** Starting"
cd source-code
ls
echo "****** About to build"
./gradlew build
ls build/libs/*.jar
cp build/libs/*.jar ../build
echo "****** Finished"
