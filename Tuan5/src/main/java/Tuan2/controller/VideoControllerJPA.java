package Tuan2.controller;

import java.io.IOException;
import java.util.List;

import Tuan2.entity.Category;
import Tuan2.entity.Video;
import Tuan2.service.CategoryServiceJPA;
import Tuan2.service.VideoServiceJPA;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
    "/admin/videos",
    "/admin/video/create",
    "/admin/video/update",
    "/admin/video/delete",
    "/admin/video/search"
})
public class VideoControllerJPA extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoServiceJPA service = new VideoServiceJPA();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        CategoryServiceJPA cateService = new CategoryServiceJPA();

        switch (action) {
            case "/admin/videos": {
                List<Video> list = service.findAll();
                req.setAttribute("videos", list);
                req.setAttribute("categories", cateService.findAll());
                req.setAttribute("page", "video");
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            case "/admin/video/delete": {
                int id = Integer.parseInt(req.getParameter("id"));
                service.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/videos");
                break;
            }
            case "/admin/video/search": {
                String keyword = req.getParameter("keyword");
                List<Video> result = service.search(keyword);
                req.setAttribute("videos", result);
                req.setAttribute("categories", cateService.findAll());
                req.setAttribute("page", "video");
                req.getRequestDispatcher("/WEB-INF/decorators/admin.jsp").forward(req, resp);
                break;
            }
            default:
                resp.sendRedirect(req.getContextPath() + "/admin/videos");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        CategoryServiceJPA cateService = new CategoryServiceJPA();

        switch (action) {
            case "/admin/video/create": {
                Video v = new Video();
                v.setTitle(req.getParameter("title"));
                v.setDescription(req.getParameter("description"));
                v.setPoster(req.getParameter("poster"));
                v.setViews(0);
                v.setActive(true);

                int cateId = Integer.parseInt(req.getParameter("cate_id"));
                Category cate = cateService.findById(cateId);
                v.setCategory(cate);

                service.create(v);
                break;
            }
            case "/admin/video/update": {
            	int id = Integer.parseInt(req.getParameter("videoId"));
                Video v = service.findById(id);
                if (v != null) {
                    v.setTitle(req.getParameter("title"));
                    v.setDescription(req.getParameter("description"));
                    v.setPoster(req.getParameter("poster"));
                    v.setActive(Boolean.parseBoolean(req.getParameter("active")));

                    int cateId = Integer.parseInt(req.getParameter("cate_id"));
                    Category cate = cateService.findById(cateId);
                    v.setCategory(cate);

                    service.update(v);
                }
                break;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/videos");
    }
}
