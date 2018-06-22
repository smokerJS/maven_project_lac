package kr.co.lac.repository.domain;

public class Project {
	private int projectNo;
	private int createdUserNo;
	private	int maseterUserNo;
	private String projectInfo;
	private String projectPic;
	private String projectName;
	private String maseterUserNickname;
	private int userCount;
	private int userNo;
	
	
	public String getMaseterUserNickname() {
		return maseterUserNickname;
	}
	public Project setMaseterUserNickname(String maseterUserNickname) {
		this.maseterUserNickname = maseterUserNickname;
		return this;
	}
	public int getUserCount() {
		return userCount;
	}
	public Project setUserCount(int userCount) {
		this.userCount = userCount;
		return this;
	}
	public int getUserNo() {
		return userNo;
	}
	public Project setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public String getProjectName() {
		return projectName;
	}
	public Project setProjectName(String projectName) {
		this.projectName = projectName;
		return this;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public Project setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	public int getCreatedUserNo() {
		return createdUserNo;
	}
	public Project setCreatedUserNo(int createUserNo) {
		this.createdUserNo = createUserNo;
		return this;
	}
	public int getMaseterUserNo() {
		return maseterUserNo;
	}
	public Project setMaseterUserNo(int maseterUserNo) {
		this.maseterUserNo = maseterUserNo;
		return this;
	}
	public String getProjectInfo() {
		return projectInfo;
	}
	public Project setProjectInfo(String projectInfo) {
		this.projectInfo = projectInfo;
		return this;
	}
	public String getProjectPic() {
		return projectPic;
	}
	public Project setProjectPic(String projectPic) {
		this.projectPic = projectPic;
		return this;
	}
}
