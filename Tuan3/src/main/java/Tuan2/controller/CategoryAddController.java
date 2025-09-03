package Tuan2.controller;

import java.io.IOException;

import Tuan2.model.CategoryModel;
import Tuan2.service.CategoryService;
import Tuan2.service.impl.CategoryServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/category/add"})
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/addCategory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("cate_name");
        String icons = req.getParameter("icons");
        int userId = 1;

        CategoryModel cate = new CategoryModel(0, name, icons, userId);
        categoryService.insert(cate);

        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
