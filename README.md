# spring-boot-cities-ui
This is a simple Spring Boot UI which can consume CITY data and present it graphically using Thymeleaf. It consumes data for example from this microservice: https://github.com/skazi-pivotal/SBoot-Cities-Service/tree/SCS

To connect the two microservices, deploy this and the back-end to cloud foundry. They will discover each other because of Eureka if you use Spring Cloud Services.
