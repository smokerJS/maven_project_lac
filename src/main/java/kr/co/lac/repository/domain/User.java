package kr.co.lac.repository.domain;

public class User {
	private int userNo;
	private String nickname;
	private String email;
	private String password;
	private String newPassword;
	private String checkNewPassword;
	
	public String getCheckNewPassword() {
		return checkNewPassword;
	}

	public void setCheckNewPassword(String checkNewPassword) {
		this.checkNewPassword = checkNewPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	private String profilePic;
	private String loginStateCode;
	private int projectNo;
	
	public int getProjectNo() {
		return projectNo;
	}

	public User setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}

	public int getUserNo() {
		return userNo;
	}
	
	public User setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public String getNickname() {
		return nickname;
	}
	public User setNickname(String nickname) {
		this.nickname = nickname;
		return this;
	}
	public String getEmail() {
		return email;
	}
	public User setEmail(String email) {
		this.email = email;
		return this;
	}
	public String getPassword() {
		return password;
	}
	public User setPassword(String password) {
		this.password = password;
		return this;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public User setProfilePic(String profilePic) {
		this.profilePic = profilePic;
		return this;
	}
	public String getLoginStateCode() {
		return loginStateCode;
	}
	public User setLoginStateCode(String loginStateCode) {
		this.loginStateCode = loginStateCode;
		return this;
	}
	
}
