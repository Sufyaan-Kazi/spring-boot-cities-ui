package io.pivotal.fe.demos.citiesui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class CitiesUiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CitiesUiApplication.class, args);
    }
}
