#!/bin/bash 
echo $1 $2
curl -s $1 | grep $2
running=`curl -s $1 | grep $2`
echo $running
if [ -z "${running}" ]
then
 exit -1 
fi
