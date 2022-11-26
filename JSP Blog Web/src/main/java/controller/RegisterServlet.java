package main.java.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.model.bean.User;
import main.java.model.bo.UserBO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Register.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// Mọi lỗi ta nên bắt ngay tại controller sẽ đảm bảo model thực hiện thành công 
		// tên đăng nhập không được để trống và không được nhỏ hơn 6 kí tự 
		if(username == "" || username == null || username.length() < 6) {
			request.setAttribute("mess_register_error", "Username can't be blank and can't be less than 6 characters !!!");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		
		// password cũng tương tự 
		if(password == "" || password == null || password.length() < 6) {
			request.setAttribute("mess_register_error", "Password can't be blank and can't be less than 6 characters !!!");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		
		// kiểm tra xem username đó có tồn tại hay không 
		UserBO UserBO = new UserBO();
		User User = null;
		try {
			User = UserBO.findByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (User == null ) {
			// vì ta để id tự động tăng nên cho nó bằng 0 để không lỗi 
			try {
			    User user = new User(username,password);
			    UserBO userBO = new UserBO();
			    userBO.register(user);
			    request.setAttribute("mess_register_succes", "Create Account Success !");
			    request.getRequestDispatcher("Register.jsp").forward(request, response);
			} 
			catch (Exception e) { // tất cả những lỗi còn lại thì in ra 
				request.setAttribute("mess_register_error", e);
				request.getRequestDispatcher("Register.jsp").forward(request, response);
			}
		}
		else {
			request.setAttribute("mess_register_error", "This username is already in use !");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		response.sendRedirect("Register.jsp");

	}

}
