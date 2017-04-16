package io.pivotal.fe.demos.citiesui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class CitiesUiApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CitiesUiApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(CitiesUiApplication.class, args);
    }
}
