# This push will be slow because we are inserting about 40k city records into the db on initialisation
./gradlew build
cf delete -f cities-ui
cf delete-service -f citiesService
cf cups citiesService -p '{"tags":"cities","uri":"http://cities-service-emea.emea.fe.pivotal.io/cities"}'
cf push -b java_buildpack_offline
