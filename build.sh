#!/bin/sh

echo "Starting"
ls
./gradlew build
ls build/libs/*.jar
