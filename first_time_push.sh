# This push will be slow because we are inserting about 40k city records into the db on initialisation
./gradlew build
APPNAME=cities-ui
SI=ServiceReg
cf unbind-service $APPNAME $SI
cf delete -f $APPNAME
#cf delete-service -f $SI
#cf create-service p-service-registry standard $SI
cf push -b java_buildpack_offline --no-start --no-route
echo ""
echo "Setting environment for SCS"
cf set-env $APPNAME CF_TARGET https://apps.emea-2.fe.gopivotal.com
# echo ""

# Sleep for service registry
# max=12
# for ((i=1; i<=$max; ++i )) ;
# do
#  echo "Pausing to allow Service Discovery to Initialise....."
#  sleep 5
# done

# Carry on pushing
echo ""
echo "Pushing App!"
cf push -b java_buildpack_offline

