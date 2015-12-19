package io.pivotal.fe.demos.citiesui.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.core.env.Environment;
import org.springframework.hateoas.hal.Jackson2HalModule;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.pivotal.fe.demos.citiesui.model.PagedCities;

@Repository
@ConfigurationProperties(prefix="pivotal")
public class CityRepository {
	private static final Logger logger = LoggerFactory.getLogger(CityRepository.class);
	private String citiesServiceName;
	
	@Autowired
	@LoadBalanced
	private RestTemplate restTemplate;
	
	public CityRepository() {
		//restTemplate = restTemplate();
		//restTemplate();
	}
	
	private void restTemplate() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		mapper.registerModule(new Jackson2HalModule());

		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
		List<MediaType> mediaTypes = new ArrayList<>();
		mediaTypes.addAll(MediaType.parseMediaTypes("application/hal+json"));
		//mediaTypes.addAll(MediaType.parseMediaTypes("application/*.hal+json"));
		converter.setSupportedMediaTypes(mediaTypes);
		converter.setObjectMapper(mapper);
		
		restTemplate.setMessageConverters(Collections.<HttpMessageConverter<?>> singletonList(converter));
		//return new RestTemplate(Collections.<HttpMessageConverter<?>> singletonList(converter));
	}
	
	public PagedCities findAll(Integer page, Integer size) {
		logger.info("Calling: " + citiesServiceName + ", " + page + ", " + size);
		restTemplate();
		ResponseEntity<PagedCities> responseEntity = restTemplate.getForEntity("http://" + citiesServiceName + "/cities?page=" + page + "&size=" + size, PagedCities.class);
		if (responseEntity.getStatusCode() != HttpStatus.OK) {
			return null;
		}
		return responseEntity.getBody();
	}
	
	public PagedCities findByNameContains(String name, Integer page, Integer size) {
		ResponseEntity<PagedCities> responseEntity = restTemplate.getForEntity("http://" + citiesServiceName + "/cities/search/nameContains?q=" + name + "&page=" + page + "&size=" + size, PagedCities.class);
		if (responseEntity.getStatusCode() != HttpStatus.OK) {
			return null;
		}

		return responseEntity.getBody();
	}

	public String getCitiesServiceName() {
		return citiesServiceName;
	}

	public void setCitiesServiceName(String citiesServiceName) {
		this.citiesServiceName = citiesServiceName;
	}
}
