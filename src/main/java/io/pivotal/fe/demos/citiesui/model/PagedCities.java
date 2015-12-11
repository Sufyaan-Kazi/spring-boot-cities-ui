package io.pivotal.fe.demos.citiesui.model;

import org.springframework.hateoas.PagedResources;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties
public class PagedCities extends PagedResources<City> {

}
