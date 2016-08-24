#!/bin/bash 

running=`curl -s $1 | grep $2`
if [-z $running]
then
 exit -1 
fi
