package com.model;

public class User {
    private Integer userId;

    private String username;

    private String password;

    private String userHeadimg;
    
    private String userNike;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUserHeadimg() {
        return userHeadimg;
    }

    public void setUserHeadimg(String userHeadimg) {
        this.userHeadimg = userHeadimg == null ? null : userHeadimg.trim();
    }
    public User() {
		// TODO Auto-generated constructor stub
	}

    
    
	public String getUserNike() {
		return userNike;
	}

	public void setUserNike(String userNike) {
		this.userNike = userNike;
	}

	public User(Integer userId, String username, String password, String userHeadimg) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.userHeadimg = userHeadimg;
	}
    
}