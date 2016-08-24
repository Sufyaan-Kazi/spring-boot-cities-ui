#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

checkAppIsDeployed()
{
  URL=`cf apps | grep $APPNAME | xargs | cut -d " " -f 6`
  if [ -z "${URL}" ]
  then
   exit 1
  fi
  echo $1 -> $URL
}

searchForCity()
{
  curl -s $URL | grep "Aldermoor"
  running=`curl -s $URL | grep "Aldermoor"`
  if [ -z "${running}" ]
  then
    exit 1
  fi
}

main()
{
  install_cli
  checkAppIsDeployed
  searchForCity
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
