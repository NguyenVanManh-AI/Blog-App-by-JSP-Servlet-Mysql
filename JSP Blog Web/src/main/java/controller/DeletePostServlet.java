package main.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.model.bean.Article;
import main.java.model.bo.ArticleBO;


@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_article = request.getParameter("id_article");
		response.getWriter().append("Served at: "+id_article).append(request.getContextPath());
		
		ArticleBO ArticleBO = new ArticleBO();
		boolean status_delete ; 
		try {
			status_delete = ArticleBO.postDelete(id_article);
			request.setAttribute("status", status_delete);
			request.getRequestDispatcher("MyPost.jsp").forward(request, response);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
