#!/bin/bash 
source commons.sh

cf_service_delete()
{
  echo $1
  #Delete the Service Instance
  EXISTS=`cf services | grep ${1} | wc -l | xargs`
  if [ $EXISTS -ne 0 ]
  then
    cf delete-service -f ${1}
  fi
}

clean_cf()
{
  echo_msg "Removing previous deployment (if necessary!)"
  cf_service_delete $SERVICE
}

main()
{
  SERVICE=citiesService
  install_cli 
  clean_cf
  URL=`cf apps | grep cities-service | xargs | cut -d " " -f 6`
  cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URL"'/cities"}'
  cf logout
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
