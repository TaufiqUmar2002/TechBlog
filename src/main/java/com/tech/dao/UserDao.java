package com.tech.dao;

import com.tech.entities.User;
import com.tech.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import java.util.Optional;

public class UserDao implements IUserDao{

    @Override
    public void saveUser(User user) {
        Session session= FactoryProvider.getFactory().openSession();
        Transaction txn = session.beginTransaction();
        session.persist(user);
        txn.commit();
        session.close();
    }

    @Override
    public Optional<User> getUserByName(String name, String email) {
        Session session =FactoryProvider.getFactory().openSession();
        SelectionQuery<User> query=session.createSelectionQuery("from User u where u.name = :uName and u.email =:uEmail",User.class);
        query.setParameter("uName",name);
        query.setParameter("uEmail",email);
        return query.uniqueResultOptional();
    }


}
