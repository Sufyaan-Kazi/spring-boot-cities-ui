#!/bin/sh 
set -e
. $APPNAME/ci/scripts/common.sh

main()
{
  cf_login 
  EXISTS=`cf services | grep ${CITIES_SERVICE_NAME} | wc -l | xargs`
  if [ $EXISTS -eq 0 ]
  then
    cf cups ${CITIES_SERVICE_NAME} -p '{"tags":"cities","uri":"http://'"$CITIES_SERVICE_ROUTE"'/cities"}'
  else
    cf uups ${CITIES_SERVICE_NAME} -p '{"tags":"cities","uri":"http://'"$CITIES_SERVICE_ROUTE"'/cities"}'
  fi
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
