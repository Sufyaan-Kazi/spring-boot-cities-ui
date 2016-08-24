#!/bin/sh 
source commons.sh

cf_app_delete()
{
  EXISTS=`cf apps | grep ${1} | wc -l | xargs`
  if [ $EXISTS -ne 0 ]
  then
    echo "Deleting app"
    cf delete -f -r ${1}
  fi
}

clean_cf()
{
  echo_msg "Removing previous deployment (if necessary!)"
  cf_app_delete $APPNAME
}

main()
{
  APPNAME=cities-ui
  install_cli 
  clean_cf
}

SECONDS=0
trap 'abort' 0
while [ "$1" != "" ]; do
case $1 in
        -u )           shift
                       CF_USER=$1
                       ;;
        -p )           shift
                       CF_PASSWORD=$1
                       ;;
        -o )           shift
                       CF_ORG=$1
                       ;;
        -s )           shift
                       CF_SPACE=$1
                       ;;
        -a )           shift
                       CF_API=$1
                       ;;
    esac
    shift
done

printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
exit 0
