package main.java.model.bean;

public class Article {
	
	private int id ; 
	private String title; 
	private String content; 
	private int id_user;
	
	// id article tự động sinh nên không cần truyền vào 
	public Article(int _id,String _title, String _content, int _id_user) {
		this.id = _id;
		this.title = _title; 
		this.content = _content;
		this.id_user = _id_user;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

}
