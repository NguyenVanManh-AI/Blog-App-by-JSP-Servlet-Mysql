package main.java.model.bo;

import java.sql.SQLException;
import java.util.List;

import main.java.model.bean.User;
import main.java.model.dao.UserDAO;

public class UserBO {	
	
	public User findByUsername(String username) throws SQLException {
		UserDAO UserDAO = new UserDAO();
		return UserDAO.findByUsername(username);
	}
	
	public void register(User user) {
		UserDAO userDAO = new UserDAO();
		userDAO.register(user);
	}
	
}
