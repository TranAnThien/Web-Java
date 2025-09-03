package Tuan2.controller;

import java.io.IOException;

import Tuan2.dao.UserDao;
import Tuan2.dao.Impl.UserDaoImpl;
import Tuan2.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/forgot")
public class ForgotPassWordController extends HttpServlet {
    private UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // mặc định hiển thị form nhập email
        req.setAttribute("step", "checkEmail");
        req.getRequestDispatcher("/views/forgotPassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("checkEmail".equals(action)) {
            String email = req.getParameter("email");
            UserModel user = userDao.findByEmail(email);

            if (user == null) {
                req.setAttribute("message", "Email không tồn tại!");
                req.setAttribute("step", "checkEmail");
            } else {
                req.setAttribute("email", email);
                req.setAttribute("step", "resetPassword");
            }
            req.getRequestDispatcher("/views/forgotPassword.jsp").forward(req, resp);

        } else if ("resetPassword".equals(action)) {
            String email = req.getParameter("email");
            String newPass = req.getParameter("newPassword");
            String confirmPass = req.getParameter("confirmPassword");

            if (!newPass.equals(confirmPass)) {
                req.setAttribute("message", "Mật khẩu xác nhận không khớp!");
                req.setAttribute("email", email);
                req.setAttribute("step", "resetPassword");
                req.getRequestDispatcher("/views/forgotPassword.jsp").forward(req, resp);
                return;
            }

            userDao.updatePassword(email, newPass);
            req.setAttribute("message", "Đổi mật khẩu thành công! Hãy đăng nhập lại.");
            req.setAttribute("step", "checkEmail"); // quay về bước nhập email
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}