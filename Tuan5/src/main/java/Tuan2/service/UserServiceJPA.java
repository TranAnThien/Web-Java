package Tuan2.service;

import java.util.List;

import Tuan2.dao.UserDaoJPA;
import Tuan2.entity.User;

public class UserServiceJPA {
    private UserDaoJPA dao = new UserDaoJPA();

    public void create(User u) {
        dao.create(u);
    }

    public void update(User u) {
        dao.update(u);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public User findById(int id) {
        return dao.findById(id);
    }

    public List<User> findAll() {
        return dao.findAll();
    }

    public List<User> search(String keyword) {
        return dao.searchByUserName(keyword);
    }
}
