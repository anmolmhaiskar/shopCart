/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anmol.shopcart.helper;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.hql.internal.ast.util.SessionFactoryHelper;

/**
 *
 * @author mhais
 */
public class FactoryProvider {
    private static SessionFactory factory;
    
    public static SessionFactory getFactory(){
        
        try{
            if(factory==null){
                factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return factory;
    }
    
    
//    private static SessionFactory sessionFactory;
//    private static StandardServiceRegistry registry;
//    public static SessionFactory getFactory(){
//        try {
//            System.out.println("sessionFactory1"+sessionFactory);
//               if(sessionFactory==null){
//                    registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build(); 
//                    MetadataSources metadataSources = new MetadataSources(registry);
//                    Metadata metadata = metadataSources.getMetadataBuilder().build();
//                    sessionFactory = metadata.getSessionFactoryBuilder().build(); 
//                    System.out.println("sessionFactory2"+sessionFactory);
//               }
//           } catch (Exception e) {
//            // handle the exception
//           }
//        return sessionFactory;
//    }
    
    
    
      
//    private static SessionFactory sessionFactory;
//    public static SessionFactory getFactory(){
//        try {
//            if(sessionFactory==null){
//                Configuration configuration = new Configuration().configure();
//                configuration.configure("hibernate.cfg.xml");
//                StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
//                sessionFactory = configuration.buildSessionFactory(ssrb.build());
//            }
//        }  catch (Exception e) {
//          // handle the exception
//                e.printStackTrace();
//           }
//        return sessionFactory;
//    }
}
