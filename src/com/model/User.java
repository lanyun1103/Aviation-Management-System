package com.model;
/**
 * 储存用户信息，和用户的getter/setter
 * @author 14215
 *
 */
public class User {
	int id;
	public String username;
	public String password;
	
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
