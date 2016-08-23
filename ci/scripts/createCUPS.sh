#!/bin/bash 
set -e

abort()
{
    echo >&2 '
    ***************
    *** ABORTED ***
    ***************
    '
    echo "An error occurred. Exiting..." >&2
    exit 1
}

echo_msg()
{
  echo ""
  echo "************** ${1} **************"
}

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

install_cli()
{
  curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
  export PATH=.:$PATH
  cf --version
  cf login -a $CF_API -u $CF_USER -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE --skip-ssl-validation
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
echo $CF_API
main
trap : 0
echo_msg "Completed in $SECONDS seconds."
