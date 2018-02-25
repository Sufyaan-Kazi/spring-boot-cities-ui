./gradlew build

./cleanup.sh

if [ -z $1 ]
then
  URI=cities-service-recognisable-wrongheadedness.cfapps.io
else
  URI=$1
fi

cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URI"'/cities"}'
cf push
