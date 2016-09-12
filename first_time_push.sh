# This push will be slow because we are inserting about 40k city records into the db on initialisation
./gradlew build
APPNAME=cities-ui
SI=ServiceReg
cf unbind-service $APPNAME $SI
cf delete -f $APPNAME
cf push -b java_buildpack_offline --no-start --no-route
echo ""
echo "Setting environment for SCS"

# Work out the CF_TARGET
CF_TARGET=`cf target | grep "API" | cut -d" " -f5| xargs`
cf set-env $APPNAME CF_TARGET $CF_TARGET

echo "Pushing App!"
BPACK=`cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs`
cf push -b ${BPACK}

