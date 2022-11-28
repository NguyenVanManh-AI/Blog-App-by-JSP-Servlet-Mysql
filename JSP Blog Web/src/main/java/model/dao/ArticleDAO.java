package main.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.java.model.bean.Article;
import main.java.model.bean.User;
import main.java.model.bean.User_Article;

public class ArticleDAO {
    private Connection conn = DB.getConnection();
	PreparedStatement preStmt;
	
    public List<Article> getAll() {
		String sql = "SELECT * FROM articles";
		List<Article> list = new ArrayList<Article>();
		try {
			preStmt = conn.prepareStatement(sql);
			ResultSet result = preStmt.executeQuery();
			
			while (result.next()) { 
				Article article = new Article(0,"","",0); // phải truyền vào vì hàm cunstructor có để thêm bài viết
				article.setId(result.getInt("id"));
				article.setTitle(result.getString("title"));
				article.setContent(result.getString("content"));
				article.setId_user(result.getInt("id_user"));
				list.add(article);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getStackTrace());
		}
		
		return list;
	} 
    
    public User_Article postDetails(String id_article) {
    	String sql = "SELECT a.id, a.title, a.content , a.id_user , u.fullname FROM articles as a LEFT JOIN users as u ON a.id_user = u.id WHERE a.id = ?";
    	User_Article User_Article = null;
		
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, id_article);
			ResultSet resultSet = preStmt.executeQuery();
			if (resultSet.next()) {
				User_Article = new User_Article(0,"","",0,"");
				User_Article.setId(resultSet.getInt("id"));
				User_Article.setTitle(resultSet.getString("title"));
				User_Article.setContent(resultSet.getString("content"));
				User_Article.setId_user(resultSet.getInt("id_user"));
				User_Article.setFullname(resultSet.getString("fullname"));
			}
		} 
		catch (SQLException ex) {
			ex.getStackTrace();
		}
		return User_Article;
	}
    
    public boolean postDelete(String id_article) {
    	String sql = "DELETE FROM articles WHERE id = ?";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, id_article);
			int resultSet = preStmt.executeUpdate(); // thay ResultSet bằng int 
			// thêm sửa xóa là executeUpdate
			// xem là executeQuery
		} 
		catch (SQLException ex) {
			ex.getStackTrace();
			return false; 
		}
		return true; 
	}
    
	public void insert(Article article) {
		String sql = "INSERT INTO articles(title, content,id_user) VALUE (?, ?, ?)";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, article.getTitle());
			preStmt.setString(2, article.getContent());
			preStmt.setInt(3, article.getId_user());
			preStmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
	}
	
	public void update(Article article) { 
		String sql = "UPDATE articles SET title = ? , content = ? WHERE id = ? ";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, article.getTitle());
			preStmt.setString(2, article.getContent());
			preStmt.setString(3, Integer.toString(article.getId()));
			preStmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
	}
    
}
