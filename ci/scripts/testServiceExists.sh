#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

main()
{
  checkSpringBootAppOnPCF $CITIES_SERVICE_ROUTE
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
