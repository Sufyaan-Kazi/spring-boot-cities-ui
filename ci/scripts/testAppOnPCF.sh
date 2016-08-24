#!/bin/bash 

echo $1
URL=`cf apps | grep cities-ui | xargs | cut -d " " -f 6`
if [ -z "${URL}" ]
then
 exit 1
fi

curl -s $URL | grep $1
running=`curl -s $URL | grep $1`
echo $running
if [ -z "${running}" ]
then
 exit 1 
fi
