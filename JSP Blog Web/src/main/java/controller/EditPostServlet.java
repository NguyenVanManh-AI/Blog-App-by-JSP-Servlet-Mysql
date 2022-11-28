package main.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.model.bean.Article;
import main.java.model.bean.User_Article;
import main.java.model.bo.ArticleBO;

@WebServlet("/EditPostServlet")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// quan trọng, nếu không có dòng này thì các giá trị được lưu trong request sẽ bị lỗi 
		// không lấy ra được tiếng việt 
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		String id_article = request.getParameter("id_article");
		ArticleBO ArticleBO = new ArticleBO();
		User_Article User_Article = null;
		try {
			User_Article = ArticleBO.postDetails(id_article);
			request.setAttribute("article_detail", User_Article);
			request.getRequestDispatcher("EditPost.jsp").forward(request, response);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// quan trọng, nếu không có dòng này thì các giá trị được lưu trong request sẽ bị lỗi 
		// không lấy ra được tiếng việt 
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
//		doGet(request, response);
		int id_article = Integer.parseInt(request.getParameter("id_article"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// title hoặc content không được để trống 
		if(title == "" || title == null || content == "" || content == null) {
			request.setAttribute("mess_edit_error", "Title or Content cannot be left blank !!!");
			doGet(request, response);
			return ; 
		}
		
		Article article = new Article(id_article,title,content,0);
		ArticleBO articleBO = new ArticleBO();
		articleBO.update(article);
		request.setAttribute("mess_edit_success", "Edit Post Success !!!");
		doGet(request, response);
		return ; 
	}

}
