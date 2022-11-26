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
import main.java.model.bean.Article;
import main.java.model.bo.ArticleBO;

@WebServlet("/PostDetailsServlet")
public class PostDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostDetailsServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_article = request.getParameter("id_article");
		
		ArticleBO ArticleBO = new ArticleBO();
		Article Article = null;
		try {
			Article = ArticleBO.postDetails(id_article);
			request.setAttribute("article_detail", Article);
			request.getRequestDispatcher("PostDetails.jsp").forward(request, response);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
