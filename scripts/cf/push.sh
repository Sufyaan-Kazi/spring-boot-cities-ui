#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd ../..
./gradlew build

cd $SCRIPTPATH
BPACK={cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs}
cf push -b ${BPACK}
