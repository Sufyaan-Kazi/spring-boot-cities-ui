#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

searchForCity()
{
  curl -s $URL | grep "Aldermoor"
  running=`curl -s $URL | grep "Aldermoor"`
  echo $running
  exitIfNull $running
}

main()
{
  cf_login

  summaryOfApps
  echo $APPNAME
  checkSpringBootAppOnPCF $APPNAME
  searchForCity
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
