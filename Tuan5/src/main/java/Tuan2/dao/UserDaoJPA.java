package Tuan2.dao;

import java.util.List;

import Tuan2.config.JPAConfigs;
import Tuan2.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UserDaoJPA {

    public void create(User user) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(User user) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(int id) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            User u = em.find(User.class, id);
            if (u != null) em.remove(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public User findById(int id) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }

    public List<User> findAll() {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.createNamedQuery("User.findAll", User.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<User> searchByUserName(String keyword) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            TypedQuery<User> q = em.createNamedQuery("User.searchByUserName", User.class);
            q.setParameter("userName", "%" + keyword + "%");
            return q.getResultList();
        } finally {
            em.close();
        }
    }
}
