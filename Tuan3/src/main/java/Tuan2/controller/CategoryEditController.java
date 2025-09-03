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

@WebServlet(urlPatterns = {"/category/edit"})
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        CategoryModel cate = categoryService.findById(id);
        req.setAttribute("cate", cate);
        req.getRequestDispatcher("/views/editCategory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	int id = Integer.parseInt(req.getParameter("cate_id"));
    	String name = req.getParameter("cate_name");
        String icons = req.getParameter("icons");
        int userId = 1;

        CategoryModel cate = new CategoryModel(id, name, icons, userId);
        categoryService.update(cate);

        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
