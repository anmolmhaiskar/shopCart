/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anmol.shopcart.dao;

import com.anmol.shopcart.entities.Category;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author mhais
 */
public class CategoryDao {
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category category){
        int catId = -1;
        try{
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            catId = (int) session.save(category);

            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return catId;
    }
    
    public Category getCategoryById(int catId){
        Category cat = null;
        try{
        Session session = this.factory.openSession();
        cat = session.find(Category.class, catId);
        session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return cat;
    }
    
    public List<Category> getCategories(){
        List<Category> catList = null;
        try{
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Category");
        catList = query.getResultList();
        session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return catList;
    }
}
