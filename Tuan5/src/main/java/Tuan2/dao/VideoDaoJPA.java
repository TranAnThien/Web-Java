package Tuan2.dao;

import java.util.List;

import Tuan2.config.JPAConfigs;
import Tuan2.entity.Video;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class VideoDaoJPA {

    public void create(Video video) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(video);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(Video video) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(video);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(int id) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            em.getTransaction().begin();
            Video v = em.find(Video.class, id);
            if (v != null) em.remove(v);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }

    public Video findById(int id) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.find(Video.class, id);
        } finally {
            em.close();
        }
    }

    public List<Video> findAll() {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            return em.createNamedQuery("Video.findAll", Video.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Video> searchByTitle(String keyword) {
        EntityManager em = JPAConfigs.getEntityManager();
        try {
            TypedQuery<Video> q = em.createNamedQuery("Video.searchByTitle", Video.class);
            q.setParameter("title", "%" + keyword + "%");
            return q.getResultList();
        } finally {
            em.close();
        }
    }
}
