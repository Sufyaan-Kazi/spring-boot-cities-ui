./gradlew build
cf delete -f -r cities-ui
cf delete-service -f citiesService
URI=cities-service-recognisable-wrongheadedness.cfapps.io

cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URI"'/cities"}'
cf push
