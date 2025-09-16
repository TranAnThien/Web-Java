package Tuan2.service;

import java.util.List;

import Tuan2.dao.CategoryDaoJPA;
import Tuan2.entity.Category;

public class CategoryServiceJPA {
	private CategoryDaoJPA dao = new CategoryDaoJPA();

    public void create(Category c) {
        dao.create(c);
    }

    public void update(Category c) {
        dao.update(c);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public Category findById(int id) {
        return dao.findById(id);
    }

    public List<Category> findAll() {
        return dao.findAll();
    }

    public List<Category> search(String keyword) {
        return dao.searchByName(keyword);
    }
}
