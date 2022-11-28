package main.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.java.model.bean.User;

public class UserDAO {
	private Connection conn = DB.getConnection();
	PreparedStatement preStmt = null;
	
	public User findByUsername(String username) {
		String sql = "SELECT * FROM users WHERE username = ?";
		User User = null;
		
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, username);
			
			ResultSet resultSet = preStmt.executeQuery();
			
			if (resultSet.next()) {
				User = new User("","","");
				User.setUsername(username);
				User.setPassword(resultSet.getString("password"));
				User.setFullname(resultSet.getString("fullname"));
				User.setId(resultSet.getInt("id"));
			}
		} catch (SQLException ex) {
			ex.getStackTrace();
		}
		return User;
	}
	
	public void register(User user) {
		String sql = "INSERT INTO users(username, password, fullname) VALUE (?, ?, ?)";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, user.getUsername());
			preStmt.setString(2, user.getPassword());
			preStmt.setString(3, user.getFullname());
			preStmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
	}
}
