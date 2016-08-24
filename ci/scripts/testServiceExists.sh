#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

searchForCity()
{
  running=`curl -s $CITIES_SERVICE_ROUTE | grep "Aldermoor"`
  if [ -z "${running}" ]
  then
    exit 1
  fi
}

main()
{
  searchForCity
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
