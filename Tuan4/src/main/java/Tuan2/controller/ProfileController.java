package Tuan2.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;

import Tuan2.model.UserModel;
import Tuan2.service.UserService;
import Tuan2.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/profile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    // Thư mục uploads trong webapp
    public static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        UserModel currentUser = (UserModel) req.getSession().getAttribute("account");
        req.setAttribute("account", currentUser);
        req.setAttribute("page", "profile");
        req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        // --- Upload avatar ---
        String fileName = "";
        try {
            Part filePart = req.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                fileName = getFileName(filePart);

                // Đường dẫn tuyệt đối đến webapp/uploads
                String uploadPath = getServletContext().getRealPath("/" + UPLOAD_DIRECTORY);

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Ghi file vào webapp/uploads
                filePart.write(uploadPath + File.separator + fileName);
            }
        } catch (FileNotFoundException e) {
            req.setAttribute("message", "Có lỗi khi upload file: " + e.getMessage());
        }

        // --- Cập nhật user ---
        UserModel user = userService.findById(id);
        if (user != null) {
            user.setFullName(fullname);
            user.setEmail(email);
            user.setPassWord(password);
            user.setPhone(phone);
            if (!fileName.isEmpty()) {
                user.setAvatar(fileName); // DB lưu tên file
            }
            userService.updateProfile(user);

            // Cập nhật session
            req.getSession().setAttribute("account", user);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/profile");
    }

    // Lấy tên file từ header content-disposition
    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return Paths.get(content.substring(content.indexOf("=") + 2, content.length() - 1))
                        .getFileName().toString();
            }
        }
        return "";
    }
}