package com.prabhsingh.dao;

import com.prabhsingh.beans.Article;
import com.prabhsingh.beans.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by prabh on 2016-11-25.
 */
public class DAO {
    SessionFactory sessionFactory = new Configuration()
            .configure()
            .buildSessionFactory();

    public User findByUserName(String username) {
        List<User> users = sessionFactory.openSession()
                .createQuery("from User where username=:user")
                .setParameter("user", username)
                .getResultList();

        if (users.size() > 0) return users.get(0);
        else return null;
    }

    public void createUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.save(user);

        session.getTransaction().commit();
        session.close();
    }

    public void saveArticle(Article a) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.saveOrUpdate(a);

        session.getTransaction().commit();
        session.close();
    }

    public List<Article> getArticles() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Article");

        List<Article> articleList = (List<Article>) query.getResultList();

        session.getTransaction().commit();
        session.close();

        return articleList;
    }

    public Article getArticle(int id) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Article where Id = :id");
        query.setParameter("id", id);

        Article a = (Article) query.getSingleResult();

        session.getTransaction().commit();
        session.close();

        return a;
    }

    public void deleteArticle(int id){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(getArticle(id));
        session.getTransaction().commit();
        session.close();
    }
}
