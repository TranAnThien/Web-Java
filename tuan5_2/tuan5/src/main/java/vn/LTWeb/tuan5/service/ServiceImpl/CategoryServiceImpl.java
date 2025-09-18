package vn.LTWeb.tuan5.service.ServiceImpl;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import vn.LTWeb.tuan5.entity.Category;
import vn.LTWeb.tuan5.repository.CategoryRepository;
import vn.LTWeb.tuan5.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository repo;

    @Override
    public Category save(Category entity) {
        return repo.save(entity);
    }

    @Override
    public List<Category> findAll() {
        return repo.findAll();
    }

    @Override
    public List<Category> findAll(Sort sort) {
        return repo.findAll(sort);
    }

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return repo.findAll(pageable);
    }

    @Override
    public Optional<Category> findById(Integer id) {
        return repo.findById(id);
    }

    @Override
    public void deleteById(Integer id) {
        repo.deleteById(id);
    }

    @Override
    public void delete(Category entity) {
        repo.delete(entity);
    }

    @Override
    public void deleteAll() {
        repo.deleteAll();
    }

    @Override
    public long count() {
        return repo.count();
    }

    @Override public List<Category> findByNameContaining(String name) {
        return repo.findByCategoryNameContaining(name);
    }
    @Override public Page<Category> findByNameContaining(String name, Pageable pageable) {
        return repo.findByCategoryNameContaining(name, pageable);
    }
}