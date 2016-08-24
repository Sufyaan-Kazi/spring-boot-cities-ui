#!/bin/sh
SECONDS=0

export TERM=${TERM:-dumb}
echo_msg "Starting"
cd cities-ui
./gradlew build
cp build/libs/*.jar ../build

printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
exit 0
