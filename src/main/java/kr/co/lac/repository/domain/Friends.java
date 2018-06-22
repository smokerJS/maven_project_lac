package kr.co.lac.repository.domain;

public class Friends {
	private int userNo;
	private int fUserNo;
	public int getUserNo() {
		return userNo;
	}
	public Friends setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public int getfUserNo() {
		return fUserNo;
	}
	public Friends setfUserNo(int fUserNo) {
		this.fUserNo = fUserNo;
		return this;
	}
	
}
