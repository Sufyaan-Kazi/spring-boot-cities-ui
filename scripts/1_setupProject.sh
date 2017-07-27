#!/bin/sh 
. common.sh

createProj()
{
  # Create new Project
  if [ $CREATE_FRESH_PROJ = "y" ]
  then
    EXISTS=`oc projects | grep $APPNAME | wc -l | xargs`
    if [ $EXISTS -ne 0 ]
    then
      oc delete project $APPNAME
      sleep 5
    fi
  fi

  echo_msg "Creating Project"
  EXISTS=`oc projects | grep $APPNAME | wc -l | xargs`
  if [ $EXISTS -eq 0 ]
  then
    oc new-project $APPNAME
  fi
}

main()
{
  # Login
  oc version
  oc_login
  createProj
  oc logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
