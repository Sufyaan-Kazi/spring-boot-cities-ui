#!/bin/sh
. $APPNAME/ci/scripts/common.sh

## Only necessary if demoing on shared env with many people pushing the same app
## Using random-route: true screws up autopilot

main()
{
  cd $APPNAME
  more manifest.yml
  cat manifest.yml | sed "s/random-route: true/host: $APPNAME-$username/g" > manifest.tmp
  echo ""
  mv manifest.tmp ../output/manifest.yml
  more ../output/manifest.yml
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
export TERM=${TERM:-dumb}
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
