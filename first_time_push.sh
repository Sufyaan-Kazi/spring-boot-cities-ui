# This push will be slow because we are inserting about 40k city records into the db on initialisation
./gradlew build
cf delete -f cities-ui
cf delete-service -f citiesService
cf cups citiesService -p '{"tags":"cities","uri":"http://INSERT YOUR URL HERE/cities"}'
BPACK=`cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs`
cf push -b ${BPACK}
