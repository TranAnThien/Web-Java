package vn.LTWeb.tuan5.service;

import org.springframework.data.domain.Sort;
import vn.LTWeb.tuan5.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    Category save(Category entity);

    List<Category> findAll();
    List<Category> findAll(Sort sort);
    Page<Category> findAll(Pageable pageable);

    Optional<Category> findById(Integer id);
    void deleteById(Integer id);
    void delete(Category entity);
    void deleteAll();
    long count();

    List<Category> findByNameContaining(String name);
    Page<Category> findByNameContaining(String name, Pageable pageable);
}
