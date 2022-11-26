package main.java.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.model.bean.Article;
import main.java.model.bo.ArticleBO;

@WebServlet("/MyPostServlet")
public class MyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleBO ArticleBO = new ArticleBO();
		List<Article> Articles = ArticleBO.getAll();
//		request.getSession().setAttribute("articles", Articles);
		request.setAttribute("articles", Articles);
		request.getRequestDispatcher("MyPost.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
