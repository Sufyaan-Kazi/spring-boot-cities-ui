#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

checkForNull()
{
  if [ -z "${1}" ]
  then
    exit 1
  fi
}

searchForCity()
{
  response=`curl -s $CITIES_SERVICE_ROUTE/health | grep '"status" : "UP"'`
  checkForNull $response
  response=`curl -s $CITIES_SERVICE_ROUTE/cities/search/name?q=Aldemoor`
  checkForNull $response
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
