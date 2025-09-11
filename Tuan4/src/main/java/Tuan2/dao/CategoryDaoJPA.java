package Tuan2.dao;

import java.util.List;

import Tuan2.config.JPAConfigs;
import Tuan2.entity.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CategoryDaoJPA {
	public void create(Category category) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(category);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(Category category) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(category);
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
            Category c = em.find(Category.class, id);
            if (c != null) em.remove(c);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public Category findById(int id) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }

    public List<Category> findAll() {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.createNamedQuery("Category.findAll", Category.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Category> searchByName(String keyword) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            TypedQuery<Category> q = em.createNamedQuery("Category.searchByName", Category.class);
            q.setParameter("name", "%" + keyword + "%");
            return q.getResultList();
        } finally {
            em.close();
        }
    }
}
