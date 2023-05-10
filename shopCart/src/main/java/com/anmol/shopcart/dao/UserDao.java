package com.anmol.shopcart.dao;

import com.anmol.shopcart.entities.User;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String queryString = " FROM User where userEmail=:email and userPassword=:password";
            Session session = this.factory.openSession();
            Query q = session.createQuery(queryString);
            q.setParameter("email", email);
            q.setParameter("password", password);
            try {
                user = (User) q.getSingleResult();
            } catch(Exception e){
            e.printStackTrace();
        }

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }
}
