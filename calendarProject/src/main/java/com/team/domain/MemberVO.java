package com.team.domain;

public class MemberVO {

	private String userId;
	private String userPassword;
	private String userName;
	private String userTel;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userTel="
				+ userTel + "]";
	}
	
}
