# spring-boot-cities-ui
This is a simple Spring Boot UI which can consume CITY data and present it graphically using Thymeleaf. 
![Cities-ui](/docs/Cities-ui.png)

It consumes data for example from this microservice: https://github.com/skazi-pivotal/SBoot-Cities-Service. The SCS branch uses Spring Cloud Services to discover the other Microservice.

To run this app in Cloud Foundry:
Edit the script first_time_push.sh and correct the URL of the running copy of the cities microservice (TIP: don't use https). Then simply run the script:

``` ./scripts/first_time_push.sh ```

This builds the code, removes previous instances, sets up the Cloud Foundry environment and pushes the app. Thereafter, just directly use ``` ./push.sh ``` to build and push the app.

To run this standalone outside of cloudfoundry, simply run:

``` ./gradlew bootRun ```

![Cities](/docs/Cities.png)
