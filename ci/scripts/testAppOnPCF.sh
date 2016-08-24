#!/bin/sh 
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

install_cli()
{
  curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
  export PATH=.:$PATH
  cf --version
  cf login -a $api -u $username -p $password -o $organization -s $space --skip-ssl-validation
}

checkAppIsDeployed()
{
  URL=`cf apps | grep cities-ui | xargs | cut -d " " -f 6`
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
  echo $running
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

main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0

