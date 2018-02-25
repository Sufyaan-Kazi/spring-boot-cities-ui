#!/bin/bash 
set -e

./gradlew build

./cleanup.sh

if [ -z $1 ]
then
  URI=cities-service-recognisable-wrongheadedness.cfapps.io
else
  URI=$1
fi

cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URI"'/cities"}'
BPACK=`cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs`
cf push -b ${BPACK}
