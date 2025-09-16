package Tuan2.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@PersistenceContext
public class JPAConfigs {
	private static EntityManagerFactory factory;
	
	public static EntityManager getEntityManager() {
		 factory = Persistence.createEntityManagerFactory("dataSource");
		 return factory.createEntityManager();
		 }
	
	public static void shutdown() {
        if (factory != null) {
            factory.close();
        }
    }
}
