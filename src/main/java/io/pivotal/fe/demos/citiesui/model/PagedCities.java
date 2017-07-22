package io.pivotal.fe.demos.citiesui.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.hateoas.PagedResources;

@JsonIgnoreProperties
public class PagedCities extends PagedResources<City> {

}
