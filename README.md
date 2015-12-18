# spring-boot-cities-ui
This is a simple Spring Boot UI which can consume CITY data and present it graphically using Thymeleaf. It consumes data for example from this microservice: https://github.com/skazi-pivotal/SBoot-Cities-Service

The SCS branch uses Spring Cloud Services to discover the other Microservice

To connect the two microservices, deploy both to CF and construct a User Provided Service within the space this app is deployed to:

```cf cups citiesService -p '{"tag":"cities","uri":"http://.....CF-ROUTE.../cities"}'```

Note - The above URL does not need to be https it can be http, especially if you are using self-generated certificates
