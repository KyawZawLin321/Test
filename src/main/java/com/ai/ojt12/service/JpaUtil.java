package com.ai.ojt12.service;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
	static EntityManagerFactory emfactory=null;
	public static EntityManagerFactory getEntityManagerFactory() {
		return emfactory = Persistence.createEntityManagerFactory("StudentRegistrationJPA");
		
	}
}
