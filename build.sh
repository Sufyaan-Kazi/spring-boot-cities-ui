#!/bin/sh

echo "****** Starting"
cd source-code
ls
ls build/libs/*.jar
echo "****** About to build"
./gradlew build
ls build/libs/*.jar
echo "****** Finished"
