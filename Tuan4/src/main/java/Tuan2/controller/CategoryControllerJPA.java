package Tuan2.controller;

import java.io.IOException;
import java.util.List;

import Tuan2.dao.CategoryDaoJPA;
import Tuan2.entity.Category;
import Tuan2.service.CategoryServiceJPA;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/admin/categories", "/admin/category/create", "/admin/category/update", "/admin/category/delete", "/admin/category/search"})
public class CategoryControllerJPA extends HttpServlet {
    private CategoryServiceJPA service = new CategoryServiceJPA();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        switch (action) {
            case "/admin/categories": {
                List<Category> list = service.findAll();
                req.setAttribute("categories", list);
                req.setAttribute("page", "category");
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            case "/admin/category/delete": {
                int id = Integer.parseInt(req.getParameter("id"));
                service.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                break;
            }
            case "/admin/category/search": {
                String keyword = req.getParameter("keyword");
                List<Category> result = service.search(keyword);
                req.setAttribute("categories", result);
                req.setAttribute("page", "category");
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            default:
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        switch (action) {
            case "/admin/category/create": {
                Category c1 = new Category(req.getParameter("cate_name"), req.getParameter("icons"));
                service.create(c1);
                break;
            }
            case "/admin/category/update": {
                int id = Integer.parseInt(req.getParameter("cate_id"));
                Category c2 = service.findById(id);
                if (c2 != null) {
                    c2.setCateName(req.getParameter("cate_name"));
                    c2.setIcons(req.getParameter("icons"));
                    service.update(c2);
                }
                break;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }
}