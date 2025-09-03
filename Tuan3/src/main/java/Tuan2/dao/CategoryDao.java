package Tuan2.dao;

import java.util.List;

import Tuan2.model.CategoryModel;

public interface CategoryDao {
    void insert(CategoryModel category);
    void update(CategoryModel category);
    void delete(int id);
    CategoryModel findById(int id);
    List<CategoryModel> findAll();
    List<CategoryModel> findByUserId(int userId);
}
