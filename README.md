# spring-boot-cities-ui
This is a simple Spring Boot UI which can consume CITY data and present it graphically using Thymeleaf. It consumes data for example from this microservice: https://github.com/skazi-pivotal/spring-boot-cities-service/tree/SCS

When deploying this microservice, in order to make it work with Eureka on Spring Cloud Services you need to edit the manifest file and add the address of your cloud foundry deployment.

To connect the two microservices, deploy this and the back-end to cloud foundry. They will discover each other because of Eureka if you use Spring Cloud Services.
