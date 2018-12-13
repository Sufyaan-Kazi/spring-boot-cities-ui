#!/bin/bash
set -e

. ./vars.txt
. ./common.sh

main() {
  #Build, tag and push image
  echo "****************** Building $APPNAME"
  cd ../..
  sudo ./gradlew build buildDocker
  cd $SCRIPTPATH
  echo -e "\n****************** Building Docker Image"
  sudo docker tag sufyaankazi/$APPNAME:1.0 $REPONAME/$PROJNAME/$APPNAME
  sudo docker images
  sudo docker push $REPONAME/$PROJNAME/$APPNAME:latest
  sudo docker system prune -f

  #Remove previous deployment
  echo -e "\n****************** Removing Previous Deploymet"
  EXISTS=$(kubectl get deployments | grep $APPNAME | wc -l)
  if [ $EXISTS -ne 0 ]
  then
    kubectl delete deployment $APPNAME
  fi
  EXISTS=$(kubectl get svc | grep lb-$APPNAME | wc -l)
  if [ $EXISTS -ne 0 ]
  then
    kubectl delete svc lb-$APPNAME
  fi

  #Change date label in yaml and ip of service
  echo -e "\n*********************** Deploying $APPNAME"
  SERVICE_IP=$(kubectl get svc | grep $SERVICE_LB | xargs | cut -d " " -f4)
  if [ -z $SERVICE_IP ]
  then
    echo "Could not locate backing microservice"
    exit 1
  fi
  echo "Found service at: $SERVICE_IP"
  sed -e 's/DATE/'"$DATE"'/g' $YML_DIR/$APPNAME.yml | sed -e 's/SERVICE_IP/'"$SERVICE_IP"'/g' > /tmp/$APPNAME_$DATE.yml

  #Deploy
  kubectl create -f /tmp/$APPNAME_$DATE.yml
  rm -f /tmp/$APPNAME_$DATE.yml
  gcloud container images list --repository $REPONAME/$PROJNAME

  #Check status
  echo -e "\n********************* $APPNAME deployed, checking status"
  getPodName ContainerCreating
  waitForAppToStart $PODNAME

  # Deploy Service
  echo -e "\n**************************** Deploying Service"
  kubectl create -f $YML_DIR/lb-$APPNAME.yml
  echo "Waiting for external ip address ......."
  EXT_IP=$(kubectl get svc | grep lb-$APPNAME | xargs | cut -d " " -f4)
  while [ $EXT_IP = "<pending>" ]
  do
    sleep 2
    EXT_IP=$(kubectl get svc | grep lb-$APPNAME | xargs | cut -d " " -f4)
  done
  sleep 1
  echo "App is now available at: http://$EXT_IP/"
}

# Run the script
trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=$(basename "$0")
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds at $DATE.\n"
trap : 0
