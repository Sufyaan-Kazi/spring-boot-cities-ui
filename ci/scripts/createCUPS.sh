#!/bin/sh 
set -e
. $APPNAME/ci/scripts/common.sh

main()
{
  SERVICE=citiesService
  cf_login 
  EXISTS=`cf services | grep ${1} | wc -l | xargs`
  if [ $EXISTS -eq 0 ]
  then
    URL=`cf apps | grep cities-service | xargs | cut -d " " -f 6`
    cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URL"'/cities"}'
  fi
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
