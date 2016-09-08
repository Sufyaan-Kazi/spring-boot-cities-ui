./gradlew build
cf delete -f cities-ui
cf delete-service -f citiesService
ROUTE=cities-service-recognisable-wrongheadedness.cfapps.io

cf cups citiesService -p '{"tags":"cities","uri":"http://'"$ROUTE"'/cities"}'
cf push
