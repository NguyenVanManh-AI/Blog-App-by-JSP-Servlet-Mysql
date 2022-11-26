package main.java.model.bo;

import java.sql.SQLException;
import java.util.List;

import main.java.model.bean.Article;
import main.java.model.bean.User;
import main.java.model.dao.ArticleDAO;
import main.java.model.dao.UserDAO;

public class ArticleBO {
	public List<Article> getAll() {
		ArticleDAO ArticleDAO = new ArticleDAO();
		return ArticleDAO.getAll();
	}
	
	public Article postDetails(String id_article) {
		ArticleDAO ArticleDAO = new ArticleDAO();
		return ArticleDAO.postDetails(id_article);
	}
	
	public boolean postDelete(String id_article) {
		ArticleDAO ArticleDAO = new ArticleDAO();
		return ArticleDAO.postDelete(id_article);
	}
	
	public void insert(Article article) {
		ArticleDAO articleDAO = new ArticleDAO();
		articleDAO.insert(article);
	}
	
	public void update(Article article) {
		ArticleDAO articleDAO = new ArticleDAO();
		articleDAO.update(article);
	}
	
}



