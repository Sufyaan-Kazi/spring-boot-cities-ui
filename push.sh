./gradlew build
BPACK={cf buildpacks | grep java | grep true | head -n 1 | cut -d ' ' -f1 | xargs}
cf push -b ${BPACK}
