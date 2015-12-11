package io.pivotal.fe.demos.citiesui.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.pivotal.fe.demos.citiesui.model.FormInput;
import io.pivotal.fe.demos.citiesui.model.PagedCities;
import io.pivotal.fe.demos.citiesui.repository.CityRepository;

@Controller
public class CitiesController {
	private static final Logger logger = LoggerFactory.getLogger(CitiesController.class);
	private CityRepository repository;

	@Autowired
	public CitiesController(CityRepository repository) {
		this.repository = repository;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model uiModel, Pageable pageable) {
		logger.info("In index message.");

		PagedCities cities = list(pageable);
		uiModel.addAttribute("pagedCities", cities);
		uiModel.addAttribute("formInput", new FormInput("", cities.getMetadata().getSize()));
		return "index";
	}

	public PagedCities list(Pageable pageable) {
		return repository.findAll(pageable.getPageNumber(), pageable.getPageSize());
	}

	@RequestMapping(value = "/", params = { "name", "size" }, method = RequestMethod.GET)
	public String search(@RequestParam("name") String name, @RequestParam("size") Long size, Model uiModel, Pageable pageable) {
		logger.info("Searching for: " + name);
		PagedCities cities = search(name, pageable);
		uiModel.addAttribute("pagedCities", cities);
		FormInput input = new FormInput(name, size);
		uiModel.addAttribute("formInput", input);
		return "index";
	}

	public PagedCities search(@RequestParam("name") String name, Pageable pageable) {
		return repository.findByNameContains(name, pageable.getPageNumber(), pageable.getPageSize());
	}
}
