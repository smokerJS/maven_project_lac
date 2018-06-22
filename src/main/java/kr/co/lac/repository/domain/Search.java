package kr.co.lac.repository.domain;

public class Search {
	private int userNo;
	private String nickname;
	private String type;	/* unknown  : 모르는 친구 
							   friends  : 아는 친구
							   request  : 친구신청
							   response : 친구요청
							*/
	private String projectName;
	private String projectInfo;
	
	
	public String getProjectInfo() {
		return projectInfo;
	}
	public void setProjectInfo(String projectInfo) {
		this.projectInfo = projectInfo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	private int projectNo;
	
	public int getProjectNo() {
		return projectNo;
	}
	public Search setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	public int getUserNo() {
		return userNo;
	}
	public Search setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public String getNickname() {
		return nickname;
	}
	public Search setNickname(String nickname) {
		this.nickname = nickname;
		return this;
	}
	public String getType() {
		return type;
	}
	public Search setType(String type) {
		this.type = type;
		return this;
	}
}
