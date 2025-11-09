package com.tech.dao;

import com.tech.entities.Category;
import com.tech.entities.Like;
import com.tech.entities.Post;
import com.tech.entities.User;
import com.tech.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import java.util.List;
import java.util.Optional;

public class CommonDao implements ICommonDao {

    @Override
    public void saveUser(User user) {
        Session session= FactoryProvider.getFactory().openSession();
        Transaction txn = session.beginTransaction();
        session.merge(user);
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

    @Override
    public List<Category> getAllCategories() {
        Session session = FactoryProvider.getFactory().openSession();
        SelectionQuery<Category> query = session.createSelectionQuery("from Category",Category.class);
        return query.getResultList();
    }
    @Override
    public Category getCategoryById(Integer id){
        Session session = FactoryProvider.getFactory().openSession();
        return session.find(Category.class,id);
    }

    @Override
    public void savePost(Post post) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(post);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Post> getAllPostByCategory(Integer id) {
        Session session = FactoryProvider.getFactory().openSession();
        SelectionQuery<Post> query =session.createSelectionQuery("from Post p where p.category.id =: categoryId",Post.class);
        query.setParameter("categoryId",id);
        return query.getResultList();
    }

    @Override
    public Post getPostById(Integer id) {
        Session session = FactoryProvider.getFactory().openSession();
        return session.find(Post.class,id);
    }

    @Override
    public User getUserById(Integer id) {
        Session session = FactoryProvider.getFactory().openSession();
        return  session.find(User.class,id);
    }

    @Override
    public Boolean saveLike(Like like) {
        Boolean flag =true;
        Session session = FactoryProvider.getFactory().openSession();
        Transaction txn = session.beginTransaction();
        session.merge(like);
        txn.commit();
        session.close();
        return flag;
    }

    @Override
    public void deleteLike(Integer userId,Integer lId){
        Session session = FactoryProvider.getFactory().openSession();
        SelectionQuery<Like> likeSelectionQuery = session.createSelectionQuery("from Like l where l.user.id = :userId",Like.class);
        likeSelectionQuery.setParameter("userId",userId);
        likeSelectionQuery.setParameter("lId",lId);
        Like like =likeSelectionQuery.getSingleResult();
        session.remove(like);
    }

    @Override
    public Long likeCount(Integer postId) {
        Session session = FactoryProvider.getFactory().openSession();
        SelectionQuery<Like> likeList= session.createSelectionQuery("from Like l where l.post.id =:pId",Like.class);
        likeList.setParameter("pId",postId);
        return (long) likeList.getResultList().size();
    }

    @Override
    public Boolean isLikeByUser(Integer id) {
        Session session = FactoryProvider.getFactory().openSession();
//        session.get()
        return false;
    }


}
