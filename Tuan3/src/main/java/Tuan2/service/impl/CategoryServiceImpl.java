package Tuan2.service.impl;

import java.util.List;

import Tuan2.dao.CategoryDao;
import Tuan2.dao.Impl.CategoryDaoImpl;
import Tuan2.model.CategoryModel;
import Tuan2.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public void insert(CategoryModel category) {
        categoryDao.insert(category);
    }

    @Override
    public void update(CategoryModel category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public CategoryModel findById(int id) {
        return categoryDao.findById(id);
    }

    @Override
    public List<CategoryModel> findAll() {
        return categoryDao.findAll();
    }
    
    @Override
    public List<CategoryModel> findByUserId(int userId) {
        return categoryDao.findByUserId(userId);
    }
}