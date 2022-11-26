package main.java.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.model.bean.User;
import main.java.model.bo.UserBO;

@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// username và password không được để trống 
		if(username == "" || username == null || password == "" || password == null) {
			request.setAttribute("mess_login_error", "Username or Password cannot be left blank !!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;  
		}
		
//		if (username == null || password == null) {
//			doGet(request, response);
//			return;
//		}
		
		UserBO UserBO = new UserBO();
		User User = null;
		try {
			User = UserBO.findByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// user không đúng => tài khoản không tồn tại 
		if (User == null) {
			request.setAttribute("mess_login_error", "Account does not exist !!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;
		}
		
		// tài khoản tồn tại nhưng password không đúng 
		if (User.getPassword().equals(password) == false) {
			request.setAttribute("mess_login_error", "Incorrect password !!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;
		}
		
		boolean isLogged = true;
		if (User == null || User.getPassword().equals(password) == false) {
			isLogged = false;
		}
		
		if (isLogged) {
			HttpSession session = request.getSession();
			session.setAttribute("username", User.getUsername());
			session.setAttribute("id", User.getId());
			response.sendRedirect("MyPost.jsp");
//			response.sendRedirect("Dashboard.jsp");
			return;
		} 
		else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
	}

}
