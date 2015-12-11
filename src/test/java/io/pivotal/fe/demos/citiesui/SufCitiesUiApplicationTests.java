package io.pivotal.fe.demos.citiesui;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import io.pivotal.fe.demos.citiesui.SufCitiesUiApplication;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = SufCitiesUiApplication.class)
@WebAppConfiguration
public class SufCitiesUiApplicationTests {

	@Test
	public void contextLoads() {
	}

}
