package com.mpark;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@PropertySource("classpath:/config.properties")
public class MparkApplication {

	public static void main(String[] args) {
		SpringApplication.run(MparkApplication.class, args);
	}

}
