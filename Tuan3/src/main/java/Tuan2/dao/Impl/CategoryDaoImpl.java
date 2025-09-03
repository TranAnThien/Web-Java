package Tuan2.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Tuan2.config.DBConnection;
import Tuan2.dao.CategoryDao;
import Tuan2.model.CategoryModel;

public class CategoryDaoImpl implements CategoryDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public void insert(CategoryModel category) {
        String sql = "INSERT INTO Category(cate_name, icons, user_id) VALUES (?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCateName());
            ps.setString(2, category.getIcons());
            ps.setInt(3, category.getUserId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void update(CategoryModel category) {
        String sql = "UPDATE Category SET cate_name=?, icons=?, user_id=? WHERE cate_id=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCateName());
            ps.setString(2, category.getIcons());
            ps.setInt(3, category.getUserId());
            ps.setInt(4, category.getCateId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Category WHERE cate_id=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public CategoryModel findById(int id) {
        String sql = "SELECT * FROM Category WHERE cate_id=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new CategoryModel(
                        rs.getInt("cate_id"),
                        rs.getString("cate_name"),
                        rs.getString("icons"),
                        rs.getInt("user_id"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<CategoryModel> findAll() {
        List<CategoryModel> list = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryModel(
                        rs.getInt("cate_id"),
                        rs.getString("cate_name"),
                        rs.getString("icons"),
                        rs.getInt("user_id")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    @Override
    public List<CategoryModel> findByUserId(int user_id) {
        List<CategoryModel> list = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE user_id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryModel cate = new CategoryModel();
                cate.setCateId(rs.getInt("cate_id"));
                cate.setCateName(rs.getString("cate_name"));
                cate.setIcons(rs.getString("icons"));
                cate.setUserId(rs.getInt("user_id"));
                list.add(cate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
