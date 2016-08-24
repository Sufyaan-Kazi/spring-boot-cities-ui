#!/bin/sh 
set -e
. $APPNAME/ci/scripts/common.sh

cf_service_delete()
{
  #Delete the Service Instance
  EXISTS=`cf services | grep ${1} | wc -l | xargs`
  if [ $EXISTS -ne 0 ]
  then
    cf delete-service -f ${1}
  fi
}

main()
{
  SERVICE=citiesService
  install_cli 
  cf_service_delete $SERVICE
  URL=`cf apps | grep cities-service | xargs | cut -d " " -f 6`
  cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URL"'/cities"}'
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
