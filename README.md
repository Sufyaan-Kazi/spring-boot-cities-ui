https://twitter.com/Sufyaan_Kazi

# spring-boot-cities-ui
This is a simple Spring Boot UI which can consume CITY data and present it graphically using Thymeleaf. 
![Cities-ui](/docs/Cities-ui.png)

It consumes data for example from this microservice: https://github.com/Sufyaan-Kazi/spring-boot-cities-service. 

To run this app in locally, simply execute ```./gradlew bootRun``` and access localhost:8081

To run this app on kubernetes, navigate into scripts/k8s, and run deployToK8s.sh. (Change values in vars.txt i necessary)

To run this app in Cloud Foundry:
Edit the script first_time_push.sh and correct the URL of the running copy of the cities microservice (TIP: don't use https). Then simply run the script:

``` ./scripts/first_time_push.sh ```

This builds the code, removes previous instances, sets up the Cloud Foundry environment and pushes the app. Thereafter, just directly use ``` ./push.sh ``` to build and push the app.

To run this standalone outside of cloudfoundry, simply run:

``` ./gradlew bootRun ```

![Cities](/docs/Cities.png)
