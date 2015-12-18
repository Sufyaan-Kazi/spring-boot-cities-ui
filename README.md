# spring-boot-cities-ui
Simple UI which can consume CITY data and present it graphically.

It works for example with this microservice: https://github.com/skazi-pivotal/SBoot-Cities-Service

To connect to two, deply both to CF and construct a User Provided Service within the space this app is deployed to:

cf cups citiesService -p '{"tag":"cities","uri":"http://.....CF-ROUTE.../cities"}'

Note - URL does not need to be https it can be http, especialy if you are using self-generated certificates
