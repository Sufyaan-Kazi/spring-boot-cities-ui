# This push will be slow because we are inserting about 40k city records into the db on initialisation
./gradlew build
cf delete -f cities-ui
cf delete-service -f citiesService
URL=cities-service-appreciational-redness.cfapps.haas-35.pez.pivotal.io
cf cups citiesService -p '{"tags":"cities","uri":"http://'"$URL"'/cities"}'
BPACK=`cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs`
cf push -b ${BPACK}
