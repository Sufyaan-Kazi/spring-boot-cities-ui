#!/bin/bash 
install_cli()
{
  curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
  export PATH=.:$PATH
  cf --version
  cf login -a $CF_API -u $CF_USER -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE --skip-ssl-validation
}

install_cli
URL=`cf apps | grep cities-ui | xargs | cut -d " " -f 6`
if [ -z "${URL}" ]
then
 exit 1
fi
echo $1 -> $URL

curl -s $URL | grep $1
running=`curl -s $URL | grep $1`
if [ -z "${running}" ]
then
 exit 1 
fi
echo $running
