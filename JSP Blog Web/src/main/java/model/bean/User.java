package main.java.model.bean;

public class User {
	private int id ; 
	private String username;
	private String password;
	
	// id User tự động sinh nên không cần truyền vào 
	public User(String _username, String _password) {
		this.username = _username;
		this.password = _password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
