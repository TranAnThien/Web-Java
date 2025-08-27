package Tuan2.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        // Thiết lập kiểu dữ liệu trả về
        resp.setContentType("text/html;charset=UTF-8");

        // Ghi trực tiếp ra trình duyệt
        resp.getWriter().println("<h2>Chào mừng bạn đến trang Home!</h2>");
        resp.getWriter().println("<a href='" + req.getContextPath() + "/logout'>Đăng xuất</a>");

    }
}
