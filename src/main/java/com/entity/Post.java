package com.entity;

import java.util.Date;

public class Post {
	 
	private int id;
	private String title;
	private String content;
	private Date date;
	private User user;
	
	public Post() {
		super();
	}

	public Post(String title, String content, Date date, User user) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
		this.user = user;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	

}
