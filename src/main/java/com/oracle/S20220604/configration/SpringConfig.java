package com.oracle.S20220604.configration;

import javax.persistence.EntityManager;
import javax.sql.DataSource;

import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {
	private final DataSource 	dataSource;
	private final EntityManager entityManager;
	
	public SpringConfig(DataSource dataSource, EntityManager entityManager) {
		this.dataSource = dataSource;
		this.entityManager = entityManager;
	}
}
