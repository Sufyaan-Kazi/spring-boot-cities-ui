#!/bin/sh

max=100
for (( i=2; i <= $max; ++i ))
do
   curl -s http://localhost:8080/cities-service-1.0/cities/ >> test.out &
   curl -s http://localhost:8081/cities-ui-1.0/ >> test.out &
   sleep 2
done

