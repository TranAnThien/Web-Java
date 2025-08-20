package Tuan1.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns= {"/login-cookie"})
public class LoginCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printW = response.getWriter();
		printW.println("<h2>Đăng nhập thất bại.</h2>");
		printW.println("<h3>Tên đăng nhập hoặc mật khẩu không chính xác.");
		printW.println("<br> <a href='" + request.getContextPath() + "/Login-Cookie.html'>Quay lại trang đăng nhập</a>");
		printW.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		if(user.equals("thien") && pass.equals("123456"))
		{
		Cookie cookie = new Cookie("username", user); 
		cookie.setMaxAge(30);
		response.addCookie(cookie);
		response.sendRedirect(request.getContextPath() + "/hello-cookie");
		}else {
		response.sendRedirect(request.getContextPath() + "/login-cookie");
		}
	}

}
