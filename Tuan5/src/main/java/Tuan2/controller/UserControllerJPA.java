package Tuan2.controller;

import java.io.IOException;
import java.util.List;

import Tuan2.entity.User;
import Tuan2.service.UserServiceJPA;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
    "/admin/users",
    "/admin/user/create",
    "/admin/user/update",
    "/admin/user/delete",
    "/admin/user/search"
})
public class UserControllerJPA extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserServiceJPA service = new UserServiceJPA();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        switch (action) {
            case "/admin/users": {
                List<User> list = service.findAll();
                req.setAttribute("users", list);
                req.setAttribute("page", "user"); // load user.jsp trong admin.jsp
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            case "/admin/user/delete": {
                int id = Integer.parseInt(req.getParameter("id"));
                service.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/users");
                break;
            }
            case "/admin/user/search": {
                String keyword = req.getParameter("keyword");
                List<User> result = service.search(keyword);
                req.setAttribute("users", result);
                req.setAttribute("page", "user");
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            default:
                resp.sendRedirect(req.getContextPath() + "/admin/users");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        switch (action) {
            case "/admin/user/create": {
                User u = new User();
                u.setUserName(req.getParameter("userName"));
                u.setPassWord(req.getParameter("passWord"));
                u.setEmail(req.getParameter("email"));
                u.setFullName(req.getParameter("fullName"));
                u.setAvatar(req.getParameter("avatar"));
                u.setRoleid(Integer.parseInt(req.getParameter("roleid")));
                u.setPhone(req.getParameter("phone"));
                u.setCreatedDate(new java.util.Date(System.currentTimeMillis()));

                service.create(u);
                break;
            }
            case "/admin/user/update": {
                int id = Integer.parseInt(req.getParameter("id"));
                User u = service.findById(id);
                if (u != null) {
                    String email = req.getParameter("email");
                    String userName = req.getParameter("userName");
                    String password = req.getParameter("passWord");
                    String roleParam = req.getParameter("roleid");

                    u.setUserName(userName);
                    if (password != null && !password.isBlank()) {
                        u.setPassWord(password);
                    }
                    u.setEmail(email);
                    u.setFullName(req.getParameter("fullName"));
                    u.setAvatar(req.getParameter("avatar"));
                    if (roleParam != null && !roleParam.isEmpty()) {
                        u.setRoleid(Integer.parseInt(roleParam));
                    }
                    u.setPhone(req.getParameter("phone"));

                    service.update(u);
                }
                break;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
