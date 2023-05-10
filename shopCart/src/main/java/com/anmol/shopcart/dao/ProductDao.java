package com.anmol.shopcart.dao;

import com.anmol.shopcart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;
    public ProductDao(SessionFactory factory){
        this.factory = factory;
    }
    
    public boolean saveProduct(Product prod){
        boolean productSaved = false;
        try{
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            int prodId = (int) session.save(prod);

            tx.commit();
            session.close();
            
            productSaved = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return productSaved;
    }
    
    public List<Product> getProducts(){
        List<Product> prodList = null;
        try{
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        prodList = query.getResultList();
        session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return prodList;
    }
}
