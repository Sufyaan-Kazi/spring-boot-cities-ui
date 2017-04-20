#!/bin/sh

max=10000000000000
for (( i=2; i <= $max; ++i ))
do
   curl -s http://localhost:8080/cities-service-1.0/cities/ >> out_test.out &
   curl -s http://localhost:8081/cities-ui-1.0/ >> out_test.out &
   sleep 2
done

