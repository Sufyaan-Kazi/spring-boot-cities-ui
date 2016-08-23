#!/bin/sh

echo "Starting"
cd source_code
ls
./gradlew build
ls build/libs/*.jar
