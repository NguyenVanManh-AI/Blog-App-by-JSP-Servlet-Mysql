package main.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.model.bean.Article;
import main.java.model.bo.ArticleBO;

@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("AddPost.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// quan trọng, nếu không có dòng này thì các giá trị được lưu trong request sẽ bị lỗi 
		// không lấy ra được tiếng việt 
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		int id_user = (int)(session.getAttribute("id"));
		
		// title hoặc content không được để trống 
		if(title == "" || title == null || content == "" || content == null) {
			request.setAttribute("mess_add_error", "Title or Content cannot be left blank !!!");
			request.getRequestDispatcher("AddPost.jsp").forward(request, response);
			return ; 
		}
		
		Article article = new Article(0,title,content,id_user);
		ArticleBO articleBO = new ArticleBO();
		articleBO.insert(article);
		request.setAttribute("mess_add_success", "Add Post Success !!!");
		request.getRequestDispatcher("AddPost.jsp").forward(request, response);
		return ; 
	}

}
