package com.tech.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        if (factory == null) {
            try {
                factory = new Configuration().configure().buildSessionFactory();
                System.out.println("Hibernate SessionFactory initialized once.");
            } catch (Throwable ex) {
                System.err.println("SessionFactory creation failed: " + ex);
                throw new ExceptionInInitializerError(ex);
            }
        }
        return factory;
    }

    public static void closeFactory() {
        if (factory != null) {
            factory.close();
        }
    }
}
