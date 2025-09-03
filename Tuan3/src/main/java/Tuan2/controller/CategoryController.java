package Tuan2.controller;

import java.io.IOException;
import java.util.List;

import Tuan2.model.CategoryModel;
import Tuan2.model.UserModel;
import Tuan2.service.CategoryService;
import Tuan2.service.impl.CategoryServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/home"})
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel user = (UserModel) req.getSession().getAttribute("account");
        if (user != null) {
            List<CategoryModel> list = categoryService.findByUserId(user.getId());
            req.setAttribute("categories", list);
        }
        req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
    }
}