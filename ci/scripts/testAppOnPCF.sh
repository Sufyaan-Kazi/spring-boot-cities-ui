#!/bin/sh 
source ./commons.sh

install_cli
URL=`cf apps | grep cities-ui | xargs | cut -d " " -f 6`
if [ -z "${URL}" ]
then
 exit 1
fi
echo $1 -> $URL

curl -s $URL | grep $1
running=`curl -s $URL | grep $1`
if [ -z "${running}" ]
then
 exit 1 
fi
echo $running

printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
exit 0
