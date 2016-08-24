#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

searchForCity()
{
  curl -s $CITIES-SERVICE-ROUTE 
  curl -s $CITIES-SERVICE-ROUTE | grep "Aldermoor"
  running=`curl -s $CITIES-SERVICE-ROUTE | grep "Aldermoor"`
  if [ -z "${running}" ]
  then
    exit 1
  fi
}

main()
{
  cf_login
  searchForCity
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
