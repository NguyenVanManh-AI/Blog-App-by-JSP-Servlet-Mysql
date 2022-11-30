package main.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.model.bean.User;
import main.java.model.bo.UserBO;

@WebServlet("/InforServlet")
public class InforServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InforServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		request.getRequestDispatcher("Infor.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		
		if(password == "" || password == null) {
			request.setAttribute("mess_infor_error", "Password can't be blank !!!");
			doGet(request, response);
			return ; 
		}
		
		if(password.length() < 6) {
			request.setAttribute("mess_infor_error", "Password can't be less than 6 characters !!!");
			doGet(request, response);
			return ; 
		}
		
		if(fullname == "" || fullname == null) {
			request.setAttribute("mess_infor_error", "Full Name can't be blank !!!");
			doGet(request, response);
			return ; 
		}
		
		User user = new User(username,password,fullname);
		UserBO userBO = new UserBO();
		userBO.update(user);
		request.setAttribute("mess_infor_success", "Update Information Success !!!");
		session.setAttribute("password", password);
		session.setAttribute("fullname", fullname);
		request.getRequestDispatcher("Infor.jsp").forward(request, response);
		return ; 
	}

}
